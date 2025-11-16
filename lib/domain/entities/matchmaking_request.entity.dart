/// Represents a matchmaking request awaiting an opponent.
class MatchmakingRequestEntity {
  /// Creates a [MatchmakingRequestEntity].
  const MatchmakingRequestEntity({
    required this.id,
    required this.gameId,
    this.createdAt,
  });

  /// Request identifier (doc id).
  final String id;

  /// Identifier of the game associated with the request.
  final String gameId;

  /// Creation date when request entered the queue.
  final DateTime? createdAt;
}
