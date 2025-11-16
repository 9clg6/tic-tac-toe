/// Parameters used to create a matchmaking request.
class CreateMatchmakingRequestParam {
  /// Builds the parameter with the associated [gameId].
  const CreateMatchmakingRequestParam({required this.gameId});

  /// The unique identifier for the game for which the matchmaking
  /// request is created.
  final String gameId;
}
