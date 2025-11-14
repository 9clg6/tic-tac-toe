import 'package:rxdart/rxdart.dart';
import 'package:starter_kit/domain/entities/case_coordinates.entity.dart';
import 'package:starter_kit/domain/entities/cell.entity.dart';
import 'package:starter_kit/domain/entities/grid.entity.dart';
import 'package:starter_kit/domain/entities/player_action.entity.dart';
import 'package:starter_kit/domain/entities/players.entity.dart';
import 'package:starter_kit/domain/entities/row.entity.dart';
import 'package:starter_kit/foundation/enum/form.enum.dart';

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

  /// Exposed stream of grid updates
  Stream<Grid> get gridStream => _gridSubject.stream;

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
    isGameEnded = false;
    players = <Players>[Players(id: 1), Players(id: 2)];
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
  void play(int playerNumber, CaseCoordinates coordinates) {
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
    _checkEnd();
    _checkWinner(grid!);
    _gridSubject.add(grid!);
  }

  /// Dispose controllers
  void dispose() {
    _gridSubject.close();
  }

  /// v2 : au lieu de chercher tous les voisins, on split croix et ronds,
  /// on parcours les deux listes en chercheant à chaque fois des coordonnées
  /// cote a cote
  void _checkWinner(Grid board) {
    final List<Cell> excludeList = <Cell>[];
    for (int i = 0; i < board.columnsRowsAmount; i++) {
      final Row currentRow = board.grid[i]!;
      for (int y = 0; y < currentRow.columns.length; y++) {
        if (isGameEnded) return;

        final Cell currentCell = currentRow.columns[y]!;

        if (currentCell.form == Form.empty) continue;

        // Exclude already checked cells from neighbors
        final List<Cell> neighbors = board
            .getNeighborsOfCaseCoordinates(currentCell.coordinates)
            .where((Cell cell) => !excludeList.contains(cell))
            .toList();

        for (final Cell neighbor in neighbors) {
          if (neighbor.form != currentCell.form) continue;
          final int deltaRow =
              neighbor.coordinates.rowNumber -
              currentCell.coordinates.rowNumber;
          final int deltaColumn =
              neighbor.coordinates.columnNumber -
              currentCell.coordinates.columnNumber;

          final int nextRow = neighbor.coordinates.rowNumber + deltaRow;
          final int nextColumn =
              neighbor.coordinates.columnNumber + deltaColumn;

          final bool isInsideBoard = _isWithinBounds(
            nextRow,
            nextColumn,
            board.columnsRowsAmount,
          );

          if (!isInsideBoard) continue;

          final Form lastCell = board.getFormByCaseCoordinates(
            CaseCoordinates(rowNumber: nextRow, columnNumber: nextColumn),
          );
          if (lastCell == neighbor.form) {
            isGameEnded = true;
            winner = _lastAction?.playerNumber;
            print('Victoire !');
          }
        }
        excludeList.add(currentCell);
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
}
