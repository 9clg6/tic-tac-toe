import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tictactoe/domain/entities/cell.entity.dart';
import 'package:tictactoe/domain/entities/cell_coordinates.entity.dart';
import 'package:tictactoe/domain/entities/grid.entity.dart';
import 'package:tictactoe/domain/entities/player_action.entity.dart';
import 'package:tictactoe/domain/entities/players.entity.dart';
import 'package:tictactoe/foundation/enum/form.enum.dart';

/// Game service, used to handle actions and party
final class GameService {
  static const int _playersAmount = 2;

  /// Game board (grid == matrix)
  Grid? grid;

  /// Players of the game
  List<Players>? players;

  PlayerAction? _lastAction;

  /// Winner of the game
  int? winner;

  /// Is game ended
  bool isGameEnded = false;

  /// Subject (Behavior) stream controller for grid updates
  final BehaviorSubject<Grid> _gridSubject = BehaviorSubject<Grid>();

  /// Replay subject that stores the full history of player actions.
  ReplaySubject<PlayerAction> _playerActionsSubject =
      ReplaySubject<PlayerAction>();

  /// Exposed stream of grid updates
  Stream<Grid> get gridStream => _gridSubject.stream;

  /// Exposed stream of players actions (replays full history to newcomers).
  Stream<PlayerAction> get playersActionsStream => _playerActionsSubject.stream;

  List<PlayerAction> get _playerActionsHistory => _playerActionsSubject.values;

  /// Getter for the current turn (player number: 1 or 2)
  int get currentPlayerTurn {
    const int firstPlayerId = 1;

    // If no action yet, the first player in the players list starts
    if (players == null || players!.isEmpty) {
      throw Exception('Players list not initialized or empty');
    }

    // 1 and not 0 because the first player is initialized with id=0+1
    if (_lastAction == null) return firstPlayerId;

    final int lastPlayerWhoPlayed = _lastAction!.playerNumber;

    // Determine the next player's turn: increment last player's id,
    // wrap to first if exceeded amount
    final int nextPlayer =
        lastPlayerWhoPlayed + 1 > (players?.length ?? _playersAmount)
        ? firstPlayerId
        : lastPlayerWhoPlayed + 1;

    return nextPlayer;
  }

  /// Initialize board
  void initialize() {
    grid = Grid.generate();
    _gridSubject.add(grid!);
    _lastAction = null;
    winner = null;
    isGameEnded = false;
    players = <Players>[Players(id: 1), Players(id: 2)];
    _resetPlayerActionsHistory();
  }

  /// Join a player into the game
  void joinPlayer() {
    if (players == null) throw Exception('Players list not initialized');

    final int amountOfPlayers = players!.length;
    players!.add(Players(id: amountOfPlayers + 1));
  }

  /// Plays a move for the given player at the specified coordinates.
  ///
  /// [playerNumber] specifies which player is making the move (1 or 2).
  /// [coordinates] specifies the cell in the grid where the player wants
  /// to play.
  ///
  /// Throws an [Exception] if the player number is not supported.
  void play(int playerNumber, CellCoordinates coordinates) {
    if (isGameEnded) return;
    final Form formToPlay = switch (playerNumber) {
      1 => Form.cross,
      2 => Form.circle,
      _ => throw Exception("Game doesn't support more than 2 players yet"),
    };

    final PlayerAction action = PlayerAction(
      playerNumber: playerNumber,
      coordinates: coordinates,
      form: formToPlay,
    );

    setFormOnCoordinates(action);
  }

  /// Sets the specified [PlayerAction.form] at the
  ///  given [PlayerAction.coordinates] in the grid.
  ///
  /// This method updates the game's grid by placing the provided form
  /// (e.g., cross or circle) at the target cell identified
  ///  by [PlayerAction.coordinates].
  /// the form is to be set.
  ///
  /// Throws an [Exception] if the grid is not initialized or
  /// if the coordinates are out of bounds.
  void setFormOnCoordinates(PlayerAction action) {
    if (grid == null) throw Exception('Grid not initialized');

    grid = grid!.setFormOnCoordinates(action.form, action.coordinates);
    _lastAction = action;
    _playerActionsSubject.add(action);
    _checkEnd();

    final Stopwatch stopwatch = Stopwatch()..start();
    _checkWinnerV2(grid!);
    stopwatch.stop();
    if (winner != null) {
      debugPrint(
        'Temps écoulé: ${stopwatch.elapsed.inMicroseconds} microsecondes',
      );
    }
    _gridSubject.add(grid!);
  }

  /// Dispose controllers
  void dispose() {
    _gridSubject.close();
    _playerActionsSubject.close();
  }

  /// v2 : au lieu de chercher tous les voisins, on split croix et ronds,
  /// on parcours les deux listes en chercheant à chaque fois des coordonnées
  /// cote a cote
  @Deprecated(
    "WinnerV2 looks to be more efficient (speed/consumtion) because it doesn't loop on every cell",
  )
  // ignore: unused_element deprecated method
  void _checkWinner(Grid board) {
    final List<CellCoordinates> excludeList = <CellCoordinates>[];
    if (isGameEnded) return;

    // Exclude already checked cells from neighbors
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

      final Form lastCell = board.getFormByCaseCoordinates(
        CellCoordinates(rowNumber: nextRow, columnNumber: nextColumn),
      );
      if (lastCell == neighbor.form) {
        isGameEnded = true;
        winner = _lastAction?.playerNumber;
        debugPrint('Victoire !');
      }
    }
    excludeList.add(_lastAction!.coordinates);
  }

  void _checkWinnerV2(Grid grid) {
    if (_playerActionsHistory.length <= 4 || _lastAction == null) return;

    final Set<CellCoordinates> playerCells = _playerActionsHistory
        .where((PlayerAction cell) => cell.form == _lastAction!.form)
        .map((PlayerAction cell) => cell.coordinates)
        .toSet();

    const List<List<int>> directions = <List<int>>[
      <int>[1, 0], // vertical
      <int>[0, 1], // horizontal
      <int>[1, 1], // diagonal down-right
      <int>[1, -1], // diagonal down-left
    ];

    for (final List<int> direction in directions) {
      final int rowDelta = direction[0];
      final int columnDelta = direction[1];

      if (_hasStreak(playerCells, rowDelta, columnDelta)) {
        winner = _lastAction!.playerNumber;
        isGameEnded = true;
        debugPrint('Victoire');
        return;
      }
    }
  }

  bool _isWithinBounds(int row, int column, int maxSize) {
    return row >= 0 && row < maxSize && column >= 0 && column < maxSize;
  }

  void _checkEnd() {
    if (grid!.allCells
        .where((Cell element) => element.form == Form.empty)
        .isEmpty) {
      isGameEnded = true;
    }
  }

  void _resetPlayerActionsHistory() {
    _playerActionsSubject.close();
    _playerActionsSubject = ReplaySubject<PlayerAction>();
  }

  // TODO(clement): In future, make this algorithm more dynamic to handle
  /// game mode which has 3+ steak to win
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
