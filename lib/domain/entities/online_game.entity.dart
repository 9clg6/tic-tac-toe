import 'package:tictactoe/domain/entities/player_action.entity.dart';

/// Represents an online game document stored in Firestore.
class OnlineGameEntity {
  /// Creates an [OnlineGameEntity].
  const OnlineGameEntity({
    required this.id,
    this.createdAt,
    this.playerIds = const <int>[],
    this.nextPlayerId = 0,
    this.actions = const <PlayerAction>[],
  });

  /// Firestore document id of the game.
  final String id;

  /// Creation date if available.
  final DateTime? createdAt;

  /// List of registered player ids in the game.
  final List<int> playerIds;

  /// Next id that should be assigned when a player joins.
  final int nextPlayerId;

  /// List of actions played in the game.
  final List<PlayerAction> actions;
}
