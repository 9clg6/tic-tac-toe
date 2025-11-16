import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/services/game.service.provider.dart';
import 'package:tictactoe/domain/entities/cell_coordinates.entity.dart';
import 'package:tictactoe/domain/entities/grid.entity.dart';
import 'package:tictactoe/domain/services/game.service.dart';
import 'package:tictactoe/presentation/screens/home/home.state.dart';

part 'home.view_model.g.dart';

/// Home view model
@riverpod
class HomeViewModel extends _$HomeViewModel {
  late GameService _gameService;

  // ignore: cancel_subscriptions its cancelled
  late StreamSubscription<Grid> _gridSubscription;

  /// Overlay constroller
  OverlayPortalController portalController = OverlayPortalController();

  /// Current player's turn
  int get playersTurn => _gameService.currentPlayerTurn;

  /// Amount of players in the game
  int get playersLength => _gameService.players?.length ?? 0;

  /// Is game ended
  bool get isGameEnded => _gameService.isGameEnded;

  /// Winner
  int? get winner => _gameService.winner;

  @override
  HomeState build() {
    _gameService = ref.watch(gameServiceProvider);

    _gridSubscription = _gameService.gridStream.listen((Grid updatedGrid) {
      state = state.copyWith(grid: updatedGrid, isLoading: false);

      if (_gameService.winner != null) {
        portalController.show();
      }
    });

    ref.onDispose(_gridSubscription.cancel);

    _gameService.initialize();

    return HomeState(isLoading: false, grid: _gameService.grid);
  }

  /// Tap on cell
  void tapOnCell({required int row, required int column}) {
    _gameService.play(
      playersTurn,
      CellCoordinates(rowNumber: row, columnNumber: column),
    );
  }

  /// Restart game
  void restartGame() {
    _gameService.initialize();
    portalController.hide();
  }
}
