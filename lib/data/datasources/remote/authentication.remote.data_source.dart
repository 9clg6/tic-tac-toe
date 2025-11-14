import 'package:tictactoe/data/model/remote/auth.remote.model.dart';
import 'package:tictactoe/domain/params/login.param.dart';

/// Authentication Data Source
abstract class AuthenticationRemoteDataSource {
  /// login
  Future<AuthRemoteModel> login(LoginParam body);

  /// forget password
  Future<void> forgetPassword(LoginParam body);
}
