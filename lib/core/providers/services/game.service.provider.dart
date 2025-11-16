import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/core/usecases/append_online_game_action.use_case.provider.dart';
import 'package:tictactoe/core/providers/core/usecases/clear_online_game_actions.use_case.provider.dart';
import 'package:tictactoe/core/providers/core/usecases/watch_online_game_sync.use_case.provider.dart';
import 'package:tictactoe/domain/services/game.service.dart';
import 'package:tictactoe/domain/services/online_game.service.dart';
import 'package:tictactoe/domain/usecases/append_online_game_action.use_case.dart';
import 'package:tictactoe/domain/usecases/clear_online_game_actions.use_case.dart';
import 'package:tictactoe/domain/usecases/watch_online_game_sync.use_case.dart';

part 'game.service.provider.g.dart';

/// Provides the singleton instance of [GameService].
@Riverpod(keepAlive: true)
GameService gameService(Ref ref) {
  final AppendOnlineGameActionUseCase appendActionUseCase = ref.watch(
    appendOnlineGameActionUseCaseProvider,
  );
  final ClearOnlineGameActionsUseCase clearActionsUseCase = ref.watch(
    clearOnlineGameActionsUseCaseProvider,
  );
  final WatchOnlineGameSyncUseCase watchSyncUseCase = ref.watch(
    watchOnlineGameSyncUseCaseProvider,
  );
  final GameService service = OnlineGameService(
    appendActionUseCase: appendActionUseCase,
    clearOnlineGameActionsUseCase: clearActionsUseCase,
    watchOnlineGameSyncUseCase: watchSyncUseCase,
  );
  ref.onDispose(service.dispose);
  return service;
}
