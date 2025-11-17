import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/config/appconfig.provider.dart';
import 'package:tictactoe/core/providers/data/datasources/local/authentication.local.data_source.provider.dart';
import 'package:tictactoe/core/providers/data/repositories/authentication.repository.provider.dart';
import 'package:tictactoe/core/providers/data/storages/authentication.secure_storage.provider.dart';
import 'package:tictactoe/firebase_options.dart';
import 'package:tictactoe/foundation/config/app_config.dart';

part 'kernel.provider.g.dart';

/// Kernel provider
@Riverpod(keepAlive: true)
Future<void> kernel(Ref ref) async {
  final AppConfig _ = ref.watch(appConfigProvider);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
