/// Parameters used to clear remote actions of an online game.
class ClearOnlineGameActionsParam {
  /// Builds params targeting [gameId].
  const ClearOnlineGameActionsParam({required this.gameId});

  /// Identifier of the online game whose action history must be cleared.
  final String gameId;
}
