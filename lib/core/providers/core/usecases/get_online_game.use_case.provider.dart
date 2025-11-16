import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/repositories/online.repository.provider.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/domain/usecases/get_online_game.use_case.dart';

part 'get_online_game.use_case.provider.g.dart';

/// Provides [GetOnlineGameUseCase].
@riverpod
Future<GetOnlineGameUseCase> getOnlineGameUseCase(Ref ref) async {
  final OnlineRepository repository = await ref.watch(
    onlineRepositoryProvider.future,
  );
  return GetOnlineGameUseCase(repository: repository);
}
