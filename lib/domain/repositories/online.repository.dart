import 'package:tictactoe/domain/entities/matchmaking_request.entity.dart';
import 'package:tictactoe/domain/entities/online_game.entity.dart';

/// Repository exposing online-related operations.
abstract class OnlineRepository {
  /// Creates an online game document.
  Future<OnlineGameEntity> createOnlineGame();

  /// Returns an online game if it exists.
  Future<OnlineGameEntity?> getOnlineGame(String id);

  /// Retrieves the oldest matchmaking request awaiting an opponent.
  Future<MatchmakingRequestEntity?> fetchOldestRequest();

  /// Creates a matchmaking request bound to the given [gameId].
  Future<MatchmakingRequestEntity> createMatchmakingRequest(String gameId);

  /// Deletes a request when it is consumed.
  Future<void> deleteMatchmakingRequest(String requestId);

  /// Claims the next player slot for the provided game and returns the id.
  Future<int> claimNextPlayerSlot(String gameId);

  /// Emits `true` when the matchmaking request is consumed.
  Stream<bool> watchMatchmakingRequestConsumed(String requestId);
}
