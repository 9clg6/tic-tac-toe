/// Parameters used to retrieve an online game document.
class GetOnlineGameParam {
  /// Builds the parameter with the targeted [gameId].
  const GetOnlineGameParam({required this.gameId});

  /// The unique identifier of the game to retrieve.
  ///
  /// This parameter is required to fetch the correct online game document.
  final String gameId;
}
