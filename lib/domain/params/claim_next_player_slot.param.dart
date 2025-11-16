/// Parameters used to claim the next player slot in an online game.
/// Parameters required to claim the next available player slot in a game.
///
/// [gameId] is the unique identifier of the game in which to claim a slot.
class ClaimNextPlayerSlotParam {
  /// Creates a [ClaimNextPlayerSlotParam] with the specified [gameId].
  const ClaimNextPlayerSlotParam({required this.gameId});

  /// The unique identifier of the game.
  final String gameId;
}
