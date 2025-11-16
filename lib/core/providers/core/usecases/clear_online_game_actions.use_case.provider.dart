import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/repositories/online_game_sync.repository.provider.dart';
import 'package:tictactoe/domain/repositories/online_game_sync.repository.dart';
import 'package:tictactoe/domain/usecases/clear_online_game_actions.use_case.dart';

part 'clear_online_game_actions.use_case.provider.g.dart';

/// Provides [ClearOnlineGameActionsUseCase].
@riverpod
ClearOnlineGameActionsUseCase clearOnlineGameActionsUseCase(Ref ref) {
  final OnlineGameSyncRepository repository = ref.watch(
    onlineGameSyncRepositoryProvider,
  );
  return ClearOnlineGameActionsUseCase(repository: repository);
}
