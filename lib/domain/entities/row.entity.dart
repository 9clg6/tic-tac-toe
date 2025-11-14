import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_kit/domain/entities/case_coordinates.entity.dart';
import 'package:starter_kit/domain/entities/cell.entity.dart';
import 'package:starter_kit/foundation/enum/form.enum.dart';

part 'row.entity.freezed.dart';

/// Row in a grid, containing cells
@freezed
abstract class Row with _$Row {
  /// Represents a row in the grid.
  ///
  /// [columns] is a map where the key is the column index
  /// and the value is the cell at that column.
  const factory Row({required Map<int, Cell> columns}) = _Row;

  /// Creates a row with the specified number of columns,
  /// initializing all cells to [Form.empty].
  ///
  /// [rowNumber] specifies the row index for this row.
  /// [columnRowSize] defines the number of columns in the row.
  ///
  /// Returns a [Row] where each key in [columns] is the column
  /// index and each value is a [Cell] initialized with [Form.empty].
  factory Row.generate(int rowNumber, int columnRowSize) {
    final Map<int, Cell> tempColumns = <int, Cell>{};

    for (int i = 0; i < columnRowSize; i++) {
      tempColumns[i] = Cell(
        coordinates: CaseCoordinates(
          rowNumber: rowNumber,
          columnNumber: i,
        ),
        form: Form.empty,
      );
    }

    return Row(columns: tempColumns);
  }
}
