import 'package:tictactoe/data/datasources/local/authentication.local.data_source.dart';
import 'package:tictactoe/data/datasources/remote/authentication.remote.data_source.dart';
import 'package:tictactoe/data/model/local/auth.local.model.dart';
import 'package:tictactoe/data/model/remote/auth.remote.model.dart';
import 'package:tictactoe/domain/entities/auth.entity.dart';
import 'package:tictactoe/domain/params/login.param.dart';
import 'package:tictactoe/domain/repositories/authentication.repository.dart';

/// Authentication Repository
final class AuthenticationRepositoryImpl extends AuthenticationRepository {
  /// Authentication Repository constructor
  AuthenticationRepositoryImpl({
    required AuthenticationRemoteDataSource remoteDataSource,
    required AuthenticationLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  /// data source
  final AuthenticationRemoteDataSource _remoteDataSource;
  final AuthenticationLocalDataSource _localDataSource;

  @override
  Future<AuthEntity> login(LoginParam body) async {
    final AuthRemoteModel loginResult = await _remoteDataSource.login(body);

    if (loginResult.token == null) {
      throw Exception('Token is null');
    }

    return AuthEntity.fromRemote(loginResult);
  }

  @override
  Future<void> forgetPassword(LoginParam body) {
    return _remoteDataSource.forgetPassword(body);
  }

  @override
  Future<void> saveAuth(AuthEntity params) async {
    final AuthLocalModel authLocalModel = AuthLocalModel.fromEntity(params);
    await _localDataSource.saveAuthToken(authLocalModel);
  }

  @override
  Future<AuthEntity?> getSavedUser() async {
    final AuthLocalModel? authLocalModel = await _localDataSource
        .getAuthToken();

    if (authLocalModel == null) {
      return null;
    }

    return AuthEntity.fromLocal(authLocalModel);
  }

  @override
  Future<void> deleteAuth() async {
    await _localDataSource.deleteAuthToken();
  }
}
