import 'package:flutter_test/flutter_test.dart';
import 'package:starter_kit/domain/entities/case_coordinates.entity.dart';
import 'package:starter_kit/domain/entities/cell.entity.dart';
import 'package:starter_kit/domain/entities/grid.entity.dart';
import 'package:starter_kit/foundation/enum/form.enum.dart';

void main() {
  group('Grid', () {
    test('generate builds a square grid filled with empty cells', () {
      const int size = 3;
      final Grid grid = Grid.generate();

      expect(grid.columnsRowsAmount, size);
      expect(grid.grid.length, size);

      for (int row = 0; row < size; row++) {
        expect(grid.grid[row], isNotNull);
        expect(grid.grid[row]!.columns.length, size);
        expect(
          grid.grid[row]!.columns.values.every(
            (Cell cell) => cell.form == Form.empty,
          ),
          isTrue,
        );
      }
    });

    test(
      'setFormOnCoordinates updates the targeted cell without '
      'mutating the original grid',
      () {
        final Grid grid = Grid.generate();
        const CaseCoordinates target = CaseCoordinates(
          rowNumber: 1,
          columnNumber: 2,
        );

        final Grid updated = grid.setFormOnCoordinates(Form.cross, target);

        expect(
          updated.grid[target.rowNumber]!.columns[target.columnNumber]!.form,
          Form.cross,
        );
        expect(
          grid.grid[target.rowNumber]!.columns[target.columnNumber]!.form,
          Form.empty,
          reason: 'Original grid stays untouched',
        );
      },
    );

    test(
      'setFormOnCoordinates ignores a move when the cell is already occupied',
      () {
        final Grid grid = Grid.generate();
        const CaseCoordinates target = CaseCoordinates(
          rowNumber: 0,
          columnNumber: 1,
        );

        final Grid firstMove = grid.setFormOnCoordinates(Form.cross, target);
        final Grid secondMove = firstMove.setFormOnCoordinates(
          Form.circle,
          target,
        );

        expect(
          secondMove.grid[target.rowNumber]!.columns[target.columnNumber]!.form,
          Form.cross,
        );
      },
    );

    test('getNeighborsOfCaseCoordinates returns only valid neighbors', () {
      final Grid grid = Grid.generate();
      const CaseCoordinates center = CaseCoordinates(
        rowNumber: 1,
        columnNumber: 1,
      );
      const CaseCoordinates corner = CaseCoordinates(
        rowNumber: 0,
        columnNumber: 0,
      );

      final List<Cell> neighborsCenter = grid.getNeighborsOfCaseCoordinates(
        center,
      );
      final List<Cell> neighborsCorner = grid.getNeighborsOfCaseCoordinates(
        corner,
      );

      expect(neighborsCenter.length, 8);
      expect(neighborsCorner.length, 3);
    });
  });
}
