import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_kit/core/providers/services/game.service.provider.dart';
import 'package:starter_kit/domain/entities/case_coordinates.entity.dart';
import 'package:starter_kit/domain/entities/grid.entity.dart';
import 'package:starter_kit/domain/services/game.service.dart';
import 'package:starter_kit/presentation/screens/home/home.state.dart';

part 'home.view_model.g.dart';

/// Home view model
@riverpod
class HomeViewModel extends _$HomeViewModel {
  late GameService _gameService;

  
  // ignore: cancel_subscriptions its cancelled
  late StreamSubscription<Grid> _gridSubscription;

  @override
  HomeState build() {
    _gameService = ref.watch(gameServiceProvider);

    _gridSubscription = _gameService.gridStream.listen((Grid updatedGrid) {
      state = state.copyWith(grid: updatedGrid, isLoading: false);
    });

    ref.onDispose(_gridSubscription.cancel);

    return const HomeState(isLoading: false);
  }

  /// Start game and create grid
  void startGame() {
    _gameService.initialize();
  }

  /// Tap on cell
  void tapOnCell({required int row, required int column}) {
    final int playersTurn = _gameService.currentPlayerTurn;

    _gameService.play(
      playersTurn,
      CaseCoordinates(rowNumber: row, columnNumber: column),
    );
  }
}
