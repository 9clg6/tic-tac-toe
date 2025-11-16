import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/core/usecases/claim_next_player_slot.use_case.provider.dart';
import 'package:tictactoe/core/providers/core/usecases/create_matchmaking_request.use_case.provider.dart';
import 'package:tictactoe/core/providers/core/usecases/create_online_game.use_case.provider.dart';
import 'package:tictactoe/core/providers/core/usecases/delete_matchmaking_request.use_case.provider.dart';
import 'package:tictactoe/core/providers/core/usecases/fetch_oldest_matchmaking_request.use_case.provider.dart';
import 'package:tictactoe/core/providers/core/usecases/get_online_game.use_case.provider.dart';
import 'package:tictactoe/core/providers/core/usecases/watch_matchmaking_request.use_case.provider.dart';
import 'package:tictactoe/core/providers/services/game.service.provider.dart';
import 'package:tictactoe/domain/services/game.service.dart';
import 'package:tictactoe/domain/services/online.service.dart';
import 'package:tictactoe/domain/usecases/claim_next_player_slot.use_case.dart';
import 'package:tictactoe/domain/usecases/create_matchmaking_request.use_case.dart';
import 'package:tictactoe/domain/usecases/create_online_game.use_case.dart';
import 'package:tictactoe/domain/usecases/delete_matchmaking_request.use_case.dart';
import 'package:tictactoe/domain/usecases/fetch_oldest_matchmaking_request.use_case.dart';
import 'package:tictactoe/domain/usecases/get_online_game.use_case.dart';
import 'package:tictactoe/domain/usecases/watch_matchmaking_request.use_case.dart';

part 'online.service.provider.g.dart';

/// Provides the [OnlineService] coordinating online flows.
@riverpod
Future<OnlineService> onlineService(Ref ref) async {
  final GameService gameService = ref.watch(gameServiceProvider);
  final CreateOnlineGameUseCase createOnlineGameUseCase = await ref.watch(
    createOnlineGameUseCaseProvider.future,
  );
  final GetOnlineGameUseCase getOnlineGameUseCase = await ref.watch(
    getOnlineGameUseCaseProvider.future,
  );
  final FetchOldestMatchmakingRequestUseCase fetchRequestUseCase = await ref
      .watch(fetchOldestMatchmakingRequestUseCaseProvider.future);
  final CreateMatchmakingRequestUseCase createRequestUseCase = await ref.watch(
    createMatchmakingRequestUseCaseProvider.future,
  );
  final DeleteMatchmakingRequestUseCase deleteRequestUseCase = await ref.watch(
    deleteMatchmakingRequestUseCaseProvider.future,
  );
  final ClaimNextPlayerSlotUseCase claimNextPlayerSlotUseCase = await ref.watch(
    claimNextPlayerSlotUseCaseProvider.future,
  );
  final WatchMatchmakingRequestUseCase watchRequestUseCase = await ref.watch(
    watchMatchmakingRequestUseCaseProvider.future,
  );

  return OnlineService(
    gameService: gameService,
    createOnlineGameUseCase: createOnlineGameUseCase,
    getOnlineGameUseCase: getOnlineGameUseCase,
    fetchOldestMatchmakingRequestUseCase: fetchRequestUseCase,
    createMatchmakingRequestUseCase: createRequestUseCase,
    deleteMatchmakingRequestUseCase: deleteRequestUseCase,
    claimNextPlayerSlotUseCase: claimNextPlayerSlotUseCase,
    watchMatchmakingRequestUseCase: watchRequestUseCase,
  );
}
