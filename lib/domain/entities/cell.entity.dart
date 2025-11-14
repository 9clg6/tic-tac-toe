import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/domain/entities/case_coordinates.entity.dart';
import 'package:tictactoe/foundation/enum/form.enum.dart';

part 'cell.entity.freezed.dart';

/// Documentation for [Cell].
///
/// [Cell] represents a single cell in the game grid, uniquely identified by its [coordinates]
/// (as a [CaseCoordinates] containing a row and column number). The [form] property indicates
/// which mark (e.g., cross, circle, or empty) occupies the cell. This entity is central to
/// representing the state of each grid position.
///
/// Typical usage:
/// ```dart
/// final cell = Cell(
///   coordinates: CaseCoordinates(rowNumber: 0, columnNumber: 1),
///   form: Form.cross,
/// );
/// ```
///
/// Equality and copying operations rely on both [coordinates] and [form].
//
@freezed
abstract class Cell with _$Cell {
  /// Constructor
  const factory Cell({
    required CaseCoordinates coordinates,
    required Form form,
  }) = _Cell;

  @override
  String toString() {
    return '$coordinates with ${form.value}';
  }
}
