import 'dart:async';

import 'package:tictactoe/domain/entities/cell_coordinates.entity.dart';
import 'package:tictactoe/domain/entities/grid.entity.dart';
import 'package:tictactoe/domain/entities/player.entity.dart';
import 'package:tictactoe/domain/entities/player_action.entity.dart';

/// Default number of players for a local match.
const int defaultPlayersAmount = 2;

/// Contract shared across local and online game services.
abstract class GameService {
  /// Latest grid snapshot.
  Grid? get grid;

  /// Registered players for the current match.
  List<Player>? get players;

  /// Winner identifier once the game ends.
  int? get winner;

  /// Whether the current match is finished.
  bool get isGameEnded;

  /// Stream emitting grid updates.
  Stream<Grid> get gridStream;

  /// Stream emitting players actions.
  Stream<PlayerAction> get playersActionsStream;

  /// Local player identifier.
  int get localPlayerId;

  /// Whether the current session is online.
  bool get isOnlineGame;

  /// Online game identifier when applicable.
  String? get onlineGameId;

  /// Whether the grid should rotate for the local player.
  bool get shouldRotateBoard;

  /// Whether the current player can interact.
  bool get canPlay;

  /// Player identifier whose turn is active.
  int get currentPlayerTurn;

  /// Initializes a new match.
  void initialize({
    int playersAmount = defaultPlayersAmount,
    bool isOnlineGame = false,
    int localPlayerId = 0,
    String? onlineGameId,
  });

  /// Adds a player to the lobby.
  void joinPlayer();

  /// Plays a move for the specified player.
  void play(int playerNumber, CellCoordinates coordinates);

  /// Releases any underlying resources.
  void dispose();

  /// Clears online history when restarting matches.
  Future<void> resetOnlineGameState();
}
