/// Parameter used to watch a matchmaking request lifetime.
/// Parameter representing the ID of the request to watch in matchmaking.
class WatchMatchmakingRequestParam {
  /// Creates a [WatchMatchmakingRequestParam] with the given [requestId].
  const WatchMatchmakingRequestParam({required this.requestId});

  /// The unique identifier of the matchmaking request to be watched.
  final String requestId;
}
