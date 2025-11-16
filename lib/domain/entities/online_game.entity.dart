/// Represents an online game document stored in Firestore.
class OnlineGameEntity {
  /// Creates an [OnlineGameEntity].
  const OnlineGameEntity({
    required this.id,
    this.createdAt,
    this.playerIds = const <int>[],
    this.nextPlayerId = 0,
  });

  /// Firestore document id of the game.
  final String id;

  /// Creation date if available.
  final DateTime? createdAt;

  /// List of registered player ids in the game.
  final List<int> playerIds;

  /// Next id that should be assigned when a player joins.
  final int nextPlayerId;
}
