/// Represents a player in the game.
///
/// This class is used to uniquely identify each player,
/// for example by assigning them an [id]. You can extend this class
/// later with additional player-related information such as name,
/// avatar, or score.
final class Players {
  /// Creates a [Players] instance with the provided [id].
  Players({required this.id});

  /// The unique identifier of the player.
  final int id;
}
