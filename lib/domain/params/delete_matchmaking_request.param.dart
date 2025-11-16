/// Parameters to delete a matchmaking request.
class DeleteMatchmakingRequestParam {
  /// Builds the parameter with the request identifier.
  const DeleteMatchmakingRequestParam({required this.requestId});

  /// The unique identifier of the matchmaking request to be deleted.
  final String requestId;
}
