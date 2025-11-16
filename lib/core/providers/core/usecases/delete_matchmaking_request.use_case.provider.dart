import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/repositories/online.repository.provider.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/domain/usecases/delete_matchmaking_request.use_case.dart';

part 'delete_matchmaking_request.use_case.provider.g.dart';

/// Provides [DeleteMatchmakingRequestUseCase].
@riverpod
Future<DeleteMatchmakingRequestUseCase> deleteMatchmakingRequestUseCase(
  Ref ref,
) async {
  final OnlineRepository repository = await ref.watch(
    onlineRepositoryProvider.future,
  );
  return DeleteMatchmakingRequestUseCase(repository: repository);
}
