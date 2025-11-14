import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/config/appconfig.provider.dart';
import 'package:tictactoe/core/providers/data/datasources/local/authentication.local.data_source.provider.dart';
import 'package:tictactoe/core/providers/data/repositories/authentication.repository.provider.dart';
import 'package:tictactoe/core/providers/data/storages/authentication.secure_storage.provider.dart';
import 'package:tictactoe/foundation/config/app_config.dart';

part 'kernel.provider.g.dart';

/// Kernel provider
@Riverpod(keepAlive: true)
Future<void> kernel(Ref ref) async {
  final AppConfig _ = ref.watch(appConfigProvider);

  // final DioClient dioClient = await ref.watch(dioClientProvider.future);
  // TokenInterceptor(
  //   dioClient: dioClient,
  //   getAuthUseCase: await ref.watch(getAuthUseCaseProvider.future),
  // );

  // final UserService userService = await ref.watch(userServiceProvider.future);
  // await userService.loadUser();

  ref.onDispose(() {
    ref
      ..invalidate(appConfigProvider)
      ..invalidate(authenticationSecureStorageProvider)
      ..invalidate(authenticationLocalDataSourceProvider)
      ..invalidate(authenticationRepositoryProvider)
      ..invalidate(authenticationSecureStorageProvider)
      ..invalidate(authenticationSecureStorageProvider);
  });
}
