import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/repositories/online_game_sync.repository.provider.dart';
import 'package:tictactoe/domain/repositories/online_game_sync.repository.dart';
import 'package:tictactoe/domain/usecases/watch_online_game_sync.use_case.dart';

part 'watch_online_game_sync.use_case.provider.g.dart';

/// Provides [WatchOnlineGameSyncUseCase].
@riverpod
WatchOnlineGameSyncUseCase watchOnlineGameSyncUseCase(Ref ref) {
  final OnlineGameSyncRepository repository = ref.watch(
    onlineGameSyncRepositoryProvider,
  );
  return WatchOnlineGameSyncUseCase(repository: repository);
}
