import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/domain/entities/cell_coordinates.entity.dart';
import 'package:tictactoe/domain/entities/grid.entity.dart';
import 'package:tictactoe/domain/services/game.service.dart';
import 'package:tictactoe/domain/services/local_game.service.dart';
import 'package:tictactoe/foundation/enum/form.enum.dart';

void main() {
  group('GameService', () {
    late GameService service;

    setUp(() {
      service = LocalGameService()..initialize();
    });

    tearDown(() {
      service.dispose();
    });

    test('initialize prepares grid, players and resets state', () {
      expect(service.grid, isNotNull);
      expect(service.players, hasLength(2));
      expect(service.isGameEnded, isFalse);
      expect(service.currentPlayerTurn, equals(0));
    });

    test('play alternates turns while filling the grid', () {
      service.play(0, const CellCoordinates(rowNumber: 0, columnNumber: 0));

      expect(service.currentPlayerTurn, equals(1));
      expect(service.grid!.grid[0]!.columns[0]!.form, equals(Form.cross));

      service.play(1, const CellCoordinates(rowNumber: 1, columnNumber: 1));

      expect(service.currentPlayerTurn, equals(0));
      expect(service.grid!.grid[1]!.columns[1]!.form, equals(Form.circle));
    });

    test('detects a horizontal victory for player 0', () {
      service
        ..play(0, const CellCoordinates(rowNumber: 0, columnNumber: 0))
        ..play(1, const CellCoordinates(rowNumber: 1, columnNumber: 0))
        ..play(0, const CellCoordinates(rowNumber: 0, columnNumber: 1))
        ..play(1, const CellCoordinates(rowNumber: 1, columnNumber: 1))
        ..play(0, const CellCoordinates(rowNumber: 0, columnNumber: 2));

      expect(service.isGameEnded, isTrue);
      expect(service.winner, equals(0));
    });

    test('detects a vertical victory for player 2', () {
      service
        ..play(0, const CellCoordinates(rowNumber: 0, columnNumber: 0))
        ..play(1, const CellCoordinates(rowNumber: 0, columnNumber: 1))
        ..play(0, const CellCoordinates(rowNumber: 0, columnNumber: 2))
        ..play(1, const CellCoordinates(rowNumber: 1, columnNumber: 1))
        ..play(0, const CellCoordinates(rowNumber: 2, columnNumber: 2))
        ..play(1, const CellCoordinates(rowNumber: 2, columnNumber: 1));

      expect(service.isGameEnded, isTrue);
      expect(service.winner, equals(1));
    });

    test('detects a diagonal victory for player 1', () {
      service
        ..play(0, const CellCoordinates(rowNumber: 0, columnNumber: 0))
        ..play(1, const CellCoordinates(rowNumber: 0, columnNumber: 1))
        ..play(0, const CellCoordinates(rowNumber: 1, columnNumber: 1))
        ..play(1, const CellCoordinates(rowNumber: 0, columnNumber: 2))
        ..play(0, const CellCoordinates(rowNumber: 2, columnNumber: 2));

      expect(service.isGameEnded, isTrue);
      expect(service.winner, equals(0));
    });

    test('stops accepting moves once a winner is found', () {
      service
        ..play(0, const CellCoordinates(rowNumber: 0, columnNumber: 0))
        ..play(1, const CellCoordinates(rowNumber: 0, columnNumber: 1))
        ..play(0, const CellCoordinates(rowNumber: 1, columnNumber: 1))
        ..play(1, const CellCoordinates(rowNumber: 0, columnNumber: 2))
        ..play(0, const CellCoordinates(rowNumber: 2, columnNumber: 2));

      final Grid? gridAfterWin = service.grid;
      service.play(1, const CellCoordinates(rowNumber: 2, columnNumber: 0));

      expect(service.grid, same(gridAfterWin));
    });
  });
}
