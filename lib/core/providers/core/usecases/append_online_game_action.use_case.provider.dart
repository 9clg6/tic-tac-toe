import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/repositories/online_game_sync.repository.provider.dart';
import 'package:tictactoe/domain/repositories/online_game_sync.repository.dart';
import 'package:tictactoe/domain/usecases/append_online_game_action.use_case.dart';

part 'append_online_game_action.use_case.provider.g.dart';

/// Provides [AppendOnlineGameActionUseCase].
@riverpod
AppendOnlineGameActionUseCase appendOnlineGameActionUseCase(Ref ref) {
  final OnlineGameSyncRepository repository = ref.watch(
    onlineGameSyncRepositoryProvider,
  );
  return AppendOnlineGameActionUseCase(repository: repository);
}
