import 'package:starter_kit/domain/entities/case_coordinates.entity.dart';
import 'package:starter_kit/foundation/enum/form.enum.dart';

/// Represents an action taken by a player at a specific cell on the grid.
///
/// Used to track which player made a move, and at what position.
final class PlayerAction {
  /// Creates a [PlayerAction] representing an action taken by a
  /// player at specific coordinates.
  ///
  /// [playerNumber] is the number of the player performing the action.
  /// [coordinates] is the location on the grid where the action is performed.
  PlayerAction({
    required this.playerNumber,
    required this.coordinates,
    required this.form,
  });

  /// The number representing the player who performed the action.
  final int playerNumber;

  /// The coordinates of the cell where the player acted.
  final CaseCoordinates coordinates;

  /// The form played by the player (e.g., cross or circle).
  ///
  /// Optional, if you want to record what form was played as part of the 
  /// action.
  /// Use this field to store the Form if needed for undo, replay, or audit.
  ///
  /// Example: Form.cross or Form.circle
  final Form form;
}
