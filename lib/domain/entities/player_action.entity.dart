import 'package:tictactoe/domain/entities/cell_coordinates.entity.dart';
import 'package:tictactoe/foundation/enum/form.enum.dart';

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

  /// Deserializes a [PlayerAction] from a Firestore map.
  ///
  /// The [map] must contain the keys 'playerNumber', 
  ///   'row', 'column', and 'form'.
  /// - 'playerNumber': int or num, representing the player who made the move.
  /// - 'row': int or num, specifying the row index on the grid.
  /// - 'column': int or num, specifying the column index on the grid.
  /// - 'form': String, matching the [Form] enum name (e.g. 'cross', 'circle').
  ///
  /// If 'form' does not match any known value, [Form.cross] is used
  /// as a fallback.
  ///
  /// Example:
  ///
  /// final action = PlayerAction.fromMap({
  ///   'playerNumber': 1,
  ///   'row': 0,
  ///   'column': 2,
  ///   'form': 'cross',
  /// });
  ///
  factory PlayerAction.fromMap(Map<String, dynamic> map) => PlayerAction(
    playerNumber: (map['playerNumber'] as num).toInt(),
    coordinates: CellCoordinates(
      rowNumber: (map['row'] as num).toInt(),
      columnNumber: (map['column'] as num).toInt(),
    ),
    form: Form.values.firstWhere(
      (Form form) => form.name == map['form'],
      orElse: () => Form.cross,
    ),
  );

  /// The number representing the player who performed the action.
  final int playerNumber;

  /// The coordinates of the cell where the player acted.
  final CellCoordinates coordinates;

  /// The form played by the player (e.g., cross or circle).
  ///
  /// Optional, if you want to record what form was played as part of the
  /// action.
  /// Use this field to store the Form if needed for undo, replay, or audit.
  ///
  /// Example: Form.cross or Form.circle
  final Form form;

  /// Converts this action to a serializable map.
  Map<String, dynamic> toMap() => <String, dynamic>{
    'playerNumber': playerNumber,
    'row': coordinates.rowNumber,
    'column': coordinates.columnNumber,
    'form': form.name,
  };
}
