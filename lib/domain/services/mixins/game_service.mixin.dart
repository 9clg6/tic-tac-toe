import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tictactoe/domain/entities/cell.entity.dart';
import 'package:tictactoe/domain/entities/cell_coordinates.entity.dart';
import 'package:tictactoe/domain/entities/grid.entity.dart';
import 'package:tictactoe/domain/entities/player.entity.dart';
import 'package:tictactoe/domain/entities/player_action.entity.dart';
import 'package:tictactoe/domain/services/game.service.dart';
import 'package:tictactoe/foundation/enum/form.enum.dart';

/// Provides the shared board logic consumed by local/online game services.
///
/// Concrete services override the lifecycle hooks (e.g.
/// [disposeResourcesBeforeInit]) to inject infrastructure-specific steps
/// without duplicating the core gameplay implementation.
mixin GameServiceMixin implements GameService {
  Grid? _grid;
  List<Player>? _players;
  PlayerAction? _lastAction;
  int? _winner;
  bool _isGameEnded = false;

  final BehaviorSubject<Grid> _gridSubject = BehaviorSubject<Grid>();
  ReplaySubject<PlayerAction> _playerActionsSubject =
      ReplaySubject<PlayerAction>();

  int _localPlayerId = 0;
  bool _isOnline = false;
  String? _onlineGameId;

  @override
  Grid? get grid => _grid;

  @override
  List<Player>? get players => _players;

  @override
  int? get winner => _winner;

  @override
  bool get isGameEnded => _isGameEnded;

  @override
  Stream<Grid> get gridStream => _gridSubject.stream;

  @override
  Stream<PlayerAction> get playersActionsStream =>
      _playerActionsSubject.stream;

  List<PlayerAction> get _playerActionsHistory =>
      _playerActionsSubject.values;

  /// Exposes the current actions history to subclasses.
  @protected
  List<PlayerAction> get playerActionsHistory => _playerActionsHistory;

  @override
  int get localPlayerId => _localPlayerId;

  @override
  bool get isOnlineGame => _isOnline;

  @override
  String? get onlineGameId => _onlineGameId;

  @override
  bool get shouldRotateBoard => _isOnline && _localPlayerId.isOdd;

  @override
  bool get canPlay => !_isOnline || currentPlayerTurn == _localPlayerId;

  @override
  int get currentPlayerTurn {
    const int firstPlayerId = 0;

    if (_players == null || _players!.isEmpty) {
      return firstPlayerId;
    }

    final Map<int, int> playCount = <int, int>{};
    for (final PlayerAction action in _playerActionsHistory) {
      playCount.update(
        action.playerNumber,
        (int value) => value + 1,
        ifAbsent: () => 1,
      );
    }

    if (playCount.length < _players!.length) {
      for (int i = 0; i < _players!.length; i++) {
        if (!playCount.containsKey(i)) {
          return i;
        }
      }
    }

    if (_playerActionsHistory.isEmpty) return firstPlayerId;
    final PlayerAction lastAction = _playerActionsHistory.last;
    final int nextPlayer = (lastAction.playerNumber + 1) % _players!.length;
    return nextPlayer;
  }

  @override
  void initialize({
    int playersAmount = defaultPlayersAmount,
    bool isOnlineGame = false,
    int localPlayerId = 0,
    String? onlineGameId,
  }) {
    disposeResourcesBeforeInit();
    _isOnline = isOnlineGame;
    _localPlayerId = localPlayerId;
    _onlineGameId = onlineGameId;
    _grid = Grid.generate();
    _gridSubject.add(_grid!);
    _lastAction = null;
    _winner = null;
    _isGameEnded = false;
    _players = List<Player>.generate(
      playersAmount,
      (int index) => Player(id: index),
    );

    _resetPlayerActionsHistory();
    configureAfterInitialize();
  }

  @override
  void joinPlayer() {
    if (_players == null) throw Exception('Players list not initialized');
    _players!.add(Player(id: _players!.length));
  }

  @override
  void play(int playerNumber, CellCoordinates coordinates) {
    if (_isGameEnded) return;
    final Form formToPlay = switch (playerNumber) {
      0 => Form.cross,
      1 => Form.circle,
      _ => throw Exception("Game doesn't support more than 2 players yet"),
    };

    final PlayerAction action = PlayerAction(
      playerNumber: playerNumber,
      coordinates: coordinates,
      form: formToPlay,
    );

    setFormOnCoordinates(action);
    handleActionPlayed(action);
  }

  /// Set form on coordinates from player action.
  @protected
  void setFormOnCoordinates(PlayerAction action) {
    if (_grid == null) throw Exception('Grid not initialized');

    _grid = _grid!.setFormOnCoordinates(action.form, action.coordinates);
    _lastAction = action;
    _playerActionsSubject.add(action);
    _checkEnd();

    final Stopwatch stopwatch = Stopwatch()..start();
    _checkWinnerV2(_grid!);
    stopwatch.stop();

    if (_winner != null) {
      debugPrint(
        'Temps écoulé: ${stopwatch.elapsed.inMicroseconds} microsecondes',
      );
    }

    _gridSubject.add(_grid!);
  }

  @override
  void dispose() {
    _gridSubject.close();
    _playerActionsSubject.close();
    cleanupOnDispose();
    _onlineGameId = null;
  }

  @override
  Future<void> resetOnlineGameState() async {}

  /// Hook executed before the mixin resets shared state.
  @protected
  void disposeResourcesBeforeInit();

  /// Hook executed after shared initialization completes.
  @protected
  void configureAfterInitialize();

  /// Triggered every time a local action has been played.
  @protected
  void handleActionPlayed(PlayerAction action);

  /// Hook executed when the service is disposed.
  @protected
  void cleanupOnDispose();

  @Deprecated(
    "WinnerV2 looks to be more efficient (speed/consumtion) because it doesn't loop on every cell",
  )
  // ignore: unused_element V2 is used
  void _checkWinner(Grid board) {
    final List<CellCoordinates> excludeList = <CellCoordinates>[];
    if (_isGameEnded) return;

    final List<Cell> neighbors = board
        .getNeighborsOfCaseCoordinates(_lastAction!.coordinates)
        .where((Cell cell) => !excludeList.contains(cell.coordinates))
        .toList();

    for (final Cell neighbor in neighbors) {
      if (neighbor.form != _lastAction!.form) continue;
      final int deltaRow =
          neighbor.coordinates.rowNumber - _lastAction!.coordinates.rowNumber;
      final int deltaColumn =
          neighbor.coordinates.columnNumber -
          _lastAction!.coordinates.columnNumber;

      final int nextRow = neighbor.coordinates.rowNumber + deltaRow;
      final int nextColumn = neighbor.coordinates.columnNumber + deltaColumn;

      final bool isInsideBoard = _isWithinBounds(
        nextRow,
        nextColumn,
        board.columnsRowsAmount,
      );
      if (!isInsideBoard) continue;

      final CellCoordinates nextCoordinates = CellCoordinates(
        rowNumber: nextRow,
        columnNumber: nextColumn,
      );

      if (board.getCellByCoordinates(nextCoordinates).form ==
          _lastAction!.form) {
        _isGameEnded = true;
        _winner = _lastAction!.playerNumber;
        return;
      }
    }
  }

  void _checkWinnerV2(Grid board) {
    if (_lastAction == null || _isGameEnded) return;

    final Form currentForm = board
        .getCellByCoordinates(_lastAction!.coordinates)
        .form;
    if (currentForm == Form.empty) return;

    final Set<CellCoordinates> coordinates = board.getCellsCoordinatesByForm(
      currentForm,
    );
    final List<(int, int)> deltas = <(int, int)>[
      (0, 1),
      (1, 0),
      (1, 1),
      (-1, 1),
    ];

    for (final (int rowDelta, int columnDelta) in deltas) {
      if (_hasStreak(coordinates, rowDelta, columnDelta)) {
        _isGameEnded = true;
        _winner = _lastAction!.playerNumber;
        return;
      }
    }
  }

  bool _isWithinBounds(int row, int column, int size) {
    return row >= 0 && column >= 0 && row < size && column < size;
  }

  void _checkEnd() {
    if (_grid!.allCells.every((Cell element) => element.form != Form.empty)) {
      _isGameEnded = true;
    }
  }

  void _resetPlayerActionsHistory() {
    _playerActionsSubject.close();
    _playerActionsSubject = ReplaySubject<PlayerAction>();
  }

  bool _hasStreak(
    Set<CellCoordinates> coordinates,
    int rowDelta,
    int columnDelta,
  ) {
    for (final CellCoordinates coordinate in coordinates) {
      final CellCoordinates second = CellCoordinates(
        rowNumber: coordinate.rowNumber + rowDelta,
        columnNumber: coordinate.columnNumber + columnDelta,
      );

      final CellCoordinates third = CellCoordinates(
        rowNumber: coordinate.rowNumber + (rowDelta * 2),
        columnNumber: coordinate.columnNumber + (columnDelta * 2),
      );

      if (coordinates.contains(second) && coordinates.contains(third)) {
        return true;
      }
    }

    return false;
  }
}
