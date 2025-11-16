/// Parameters required to append an action to an online game.
class AppendOnlineGameActionParam {
  /// Creates a payload referencing the [gameId] and serialized [action].
  const AppendOnlineGameActionParam({
    required this.gameId,
    required this.action,
  });

  /// Target online game identifier.
  final String gameId;

  /// Serialized action to append.
  final Map<String, dynamic> action;
}
