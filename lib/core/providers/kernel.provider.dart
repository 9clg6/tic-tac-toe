import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/config/appconfig.provider.dart';
import 'package:tictactoe/firebase_options.dart';
import 'package:tictactoe/foundation/config/app_config.dart';

part 'kernel.provider.g.dart';

/// Kernel provider
@Riverpod(keepAlive: true)
Future<void> kernel(Ref ref) async {
  final AppConfig _ = ref.watch(appConfigProvider);

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on Exception catch (e) {
    debugPrint('Impossible to initialize Firebase: $e');
  }

  ref.onDispose(() {
    ref.invalidate(appConfigProvider);
  });
}
