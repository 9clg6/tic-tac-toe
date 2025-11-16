import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/repositories/online.repository.provider.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/domain/usecases/fetch_oldest_matchmaking_request.use_case.dart';

part 'fetch_oldest_matchmaking_request.use_case.provider.g.dart';

/// Provides [FetchOldestMatchmakingRequestUseCase].
@riverpod
Future<FetchOldestMatchmakingRequestUseCase>
fetchOldestMatchmakingRequestUseCase(Ref ref) async {
  final OnlineRepository repository = await ref.watch(
    onlineRepositoryProvider.future,
  );
  return FetchOldestMatchmakingRequestUseCase(repository: repository);
}
