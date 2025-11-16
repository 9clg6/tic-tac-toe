/// Parameters used to watch a remote online game sync document.
class WatchOnlineGameSyncParam {
  /// Builds params targeting the provided [gameId].
  const WatchOnlineGameSyncParam({required this.gameId});

  /// Identifier of the online game document to observe.
  final String gameId;
}
