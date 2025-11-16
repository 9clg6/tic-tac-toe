import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/repositories/online.repository.provider.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/domain/usecases/create_online_game.use_case.dart';

part 'create_online_game.use_case.provider.g.dart';

/// Provides [CreateOnlineGameUseCase].
@riverpod
Future<CreateOnlineGameUseCase> createOnlineGameUseCase(Ref ref) async {
  final OnlineRepository repository = await ref.watch(
    onlineRepositoryProvider.future,
  );
  return CreateOnlineGameUseCase(repository: repository);
}
