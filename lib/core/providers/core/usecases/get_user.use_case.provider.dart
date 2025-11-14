import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/repositories/user.repository.provider.dart';
import 'package:tictactoe/domain/repositories/user.repository.dart';
import 'package:tictactoe/domain/usecases/get_user.use_case.dart';

part 'get_user.use_case.provider.g.dart';

/// Get user use case provider
@riverpod
Future<GetUserUseCase> getUserUseCase(Ref ref) async {
  final UserRepository repository = await ref.watch(
    userRepositoryProvider.future,
  );

  return GetUserUseCase(userRepository: repository);
}
