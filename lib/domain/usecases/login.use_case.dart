import 'package:tictactoe/domain/entities/auth.entity.dart';
import 'package:tictactoe/domain/params/login.param.dart';
import 'package:tictactoe/domain/repositories/authentication.repository.dart';
import 'package:tictactoe/foundation/interfaces/future.usecases.dart';

/// Login Use Case
class LoginUseCase
    extends FutureUseCaseWithParams<AuthEntity, LoginParam> {
  /// Login Use Case constructor
  LoginUseCase({required this.repository});

  /// repository
  final AuthenticationRepository repository;

  @override
  Future<AuthEntity> invoke(LoginParam body) async {
    return repository.login(body);
  }
}
