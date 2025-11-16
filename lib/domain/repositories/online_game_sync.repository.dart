import 'package:tictactoe/domain/entities/online_game_sync.entity.dart';

/// Provides low-level sync operations for online games.
abstract class OnlineGameSyncRepository {
  /// Streams live updates for a given online game document.
  Stream<OnlineGameSyncEntity> watchGame(String gameId);

  /// Appends an action entry to the remote game document.
  Future<void> appendAction(String gameId, Map<String, dynamic> action);

  /// Clears the remote action history (used when restarting a match).
  Future<void> clearActions(String gameId);
}
