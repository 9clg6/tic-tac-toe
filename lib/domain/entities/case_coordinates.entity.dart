import 'package:freezed_annotation/freezed_annotation.dart';

part 'case_coordinates.entity.freezed.dart';

/// Coordinates of a case in the grid
///
/// CONVENTION : (x,y) where x = row number, y = column number
/// In matrix :
/// (1,2,3)
/// (4,5,6)
/// (7,8,9)
///
/// ex. (1,1) = 5
@freezed
abstract class CaseCoordinates with _$CaseCoordinates {
  /// Creates coordinates for a cell in the grid.
  ///
  /// [rowNumber] is the row index of the cell.
  /// [columnNumber] is the column index of the cell.
  const factory CaseCoordinates({
    /// The row index of the cell.
    required int rowNumber,

    /// The column index of the cell.
    required int columnNumber,
  }) = _CaseCoordinates;

  @override
  String toString() => '($rowNumber;$columnNumber)';
}
