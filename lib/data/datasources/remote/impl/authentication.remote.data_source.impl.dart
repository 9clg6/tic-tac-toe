import 'package:dio/dio.dart';
import 'package:tictactoe/data/bodies/login.param.dart';
import 'package:tictactoe/data/datasources/remote/authentication.remote.data_source.dart';
import 'package:tictactoe/data/endpoint/authentication.endpoint.dart';
import 'package:tictactoe/data/model/remote/auth.remote.model.dart';
import 'package:tictactoe/domain/params/login.param.dart';

/// Authentication Data Source
final class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  /// Authentication Data Source constructor
  AuthenticationRemoteDataSourceImpl({required AuthenticationEndpoint endpoint})
    : _endpoint = endpoint;

  /// endpoint
  final AuthenticationEndpoint _endpoint;

  /// login
  @override
  Future<AuthRemoteModel> login(LoginParam body) async {
    AuthRemoteModel? response;
    try {
      final String jwtToken = await _endpoint.login(
        LoginBody.fromUseCaseParams(body),
      );
      response = AuthRemoteModel(token: jwtToken.replaceAll('"', ''));
    } on DioException catch (exception) {
      final int? statusCode = exception.response?.statusCode;
      switch (statusCode) {
        default:
          rethrow;
      }
    }

    return response;
  }

  /// forget password
  @override
  Future<void> forgetPassword(LoginParam body) async {
    throw UnimplementedError();
  }
}
