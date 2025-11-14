import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/data/repositories/authentication.repository.provider.dart';
import 'package:tictactoe/domain/repositories/authentication.repository.dart';
import 'package:tictactoe/domain/usecases/login.use_case.dart';

part 'login.use_case.provider.g.dart';

/// Login Use Case provider
@riverpod
Future<LoginUseCase> loginUseCase(Ref ref) async {
  final AuthenticationRepository repository = await ref.watch(
    authenticationRepositoryProvider.future,
  );

  return LoginUseCase(repository: repository);
}
