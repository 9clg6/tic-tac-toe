import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_kit/domain/entities/case_coordinates.entity.dart';
import 'package:starter_kit/domain/entities/cell.entity.dart';
import 'package:starter_kit/domain/entities/row.entity.dart';
import 'package:starter_kit/foundation/enum/form.enum.dart';

part 'grid.entity.freezed.dart';

/// Grid representing the game board
@freezed
abstract class Grid with _$Grid {
  /// Represents the state of each cell in the grid,
  /// where each key is the cell index and the value is
  /// the form played at that cell (if any).
  const factory Grid({
    required Map<int, Row> grid,
    required int columnsRowsAmount,
  }) = _Grid;

  /// Creates a grid with the specified number of columns and rows.
  ///
  /// [columnRowSize] defines both the number of columns and rows in the grid.
  factory Grid.generate([int columnRowSize = 3]) {
    final Map<int, Row> tempGrid = <int, Row>{};

    for (int i = 0; i < columnRowSize; i++) {
      tempGrid.putIfAbsent(i, () => Row.generate(i, columnRowSize));
    }

    return Grid(grid: tempGrid, columnsRowsAmount: columnRowSize);
  }
}

/// Extension for additional grid manipulation and utility methods.
/// Adds functionalities such as setting forms at specific coordinates,
/// checking the grid's state, and other game-specific helpers.
////
/// Use these extension methods on [Grid] to conveniently interact with and
/// mutate the board in an immutable and functional style.
////
/// Example:
/// ```dart
/// final newGrid = grid.setFormOnCoordinates(form, coordinates);
/// ```
////
/// See also:
/// - [setFormOnCoordinates]
/// - [Grid]
/// - [CaseCoordinates]
/// - [Row]

extension GridExtension on Grid {
  /// Total cells
  int get totalCells => columnsRowsAmount * columnsRowsAmount;

  /// All cells in one list
  List<Cell> get allCells =>
      grid.values.expand((Row row) => row.columns.values).toList();

  /// Sets the specified [formToPlay] at the given [coordinates] in the grid.
  ///
  /// Returns a new [Grid] with the form placed at the specified coordinates.
  Grid setFormOnCoordinates(Form formToPlay, CaseCoordinates coordinates) {
    final Row relatedRow = grid[coordinates.rowNumber]!;

    final Map<int, Cell> updatedColumns = Map<int, Cell>.from(
      relatedRow.columns,
    );
    final bool isColumnEmpty =
        updatedColumns[coordinates.columnNumber]!.form == Form.empty;
    if (!isColumnEmpty) return this;

    updatedColumns[coordinates.columnNumber] = Cell(
      coordinates: coordinates,
      form: formToPlay,
    );

    final Map<int, Cell> updatedCells = Map<int, Cell>.from(relatedRow.columns);
    updatedCells[coordinates.columnNumber] = Cell(
      coordinates: coordinates,
      form: formToPlay,
    );
    final Row updatedRow = relatedRow.copyWith(columns: updatedCells);
    final Map<int, Row> updatedGrid = Map<int, Row>.from(grid);
    updatedGrid[coordinates.rowNumber] = updatedRow;

    return copyWith(grid: updatedGrid);
  }

  /// Get form by case coordinates
  Form getFormByCaseCoordinates(CaseCoordinates coordinates) {
    final Row row = grid[coordinates.rowNumber]!;
    final Cell cellInColumn = row.columns[coordinates.columnNumber]!;
    return cellInColumn.form;
  }

  /// Get getNeighborsOfCaseCoordinates
  ///
  /// v2: fold puis where avec la condition
  List<Cell> getNeighborsOfCaseCoordinates(CaseCoordinates coordinates) {
    const int minXY = 0;
    final int maxXY = columnsRowsAmount - 1;
    final int rowNumber = coordinates.rowNumber;
    final int columnNumber = coordinates.columnNumber;

    final List<Cell> neighbors = <Cell>[];

    // Only consider the 8 possible neighboring offsets, but must be valid positions
    for (int dr = -1; dr <= 1; dr++) {
      for (int dc = -1; dc <= 1; dc++) {
        // Skip the cell itself
        if (dr == 0 && dc == 0) continue;

        final int newRow = rowNumber + dr;
        final int newCol = columnNumber + dc;

        // Check bounds -- both must be within range!
        if (newRow >= minXY &&
            newRow <= maxXY &&
            newCol >= minXY &&
            newCol <= maxXY) {
          final CaseCoordinates neighborCoord = CaseCoordinates(
            rowNumber: newRow,
            columnNumber: newCol,
          );
          neighbors.add(
            allCells.firstWhere(
              (Cell element) => element.coordinates == neighborCoord,
            ),
          );
        }
      }
    }

    return neighbors;
  }
}
