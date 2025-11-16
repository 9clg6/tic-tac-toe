import 'package:dio/dio.dart';
import 'package:tictactoe/data/clients/dio.client.dart';
import 'package:tictactoe/domain/entities/auth.entity.dart';
import 'package:tictactoe/domain/usecases/get_auth.use_case.dart';
import 'package:tictactoe/foundation/interfaces/results.usecases.dart';

///
/// [HeaderInterceptor]
///
class HeaderInterceptor {
  /// HeaderInterceptor constructor
  HeaderInterceptor({
    required DioClient dioClient,
    required GetAuthUseCase getAuthUseCase,
  }) : _dioClient = dioClient,
       _getAuthUseCase = getAuthUseCase {
    _registerInterceptor();
  }

  final DioClient _dioClient;
  final GetAuthUseCase _getAuthUseCase;

  void _registerInterceptor() {
    _dioClient.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest:
            (
              RequestOptions requestOptions,
              RequestInterceptorHandler handler,
            ) async {
              requestOptions.headers.addAll(<String, dynamic>{
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              });

              final ResultState<AuthEntity?> currentAuth = await _getAuthUseCase
                  .execute();

              if (currentAuth.status == StateStatus.success) {
                final AuthEntity? authEntity = currentAuth.data;
                if (authEntity != null && authEntity.token != null) {
                  requestOptions.headers.addAll(<String, dynamic>{
                    'Authorization': 'Bearer ${authEntity.token}',
                  });
                }
              }

              handler.next(requestOptions);
              return;
            },
      ),
    );
  }
}
