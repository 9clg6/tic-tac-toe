import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/firebase_options.dart';
import 'package:tictactoe/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const <Locale>[Locale('fr')],
        path: 'assets/translations',
        // assetLoader: const CodegenLoader(),
        child: const RootAppWidget(),
      ),
    ),
  );
}
