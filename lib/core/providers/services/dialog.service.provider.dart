import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/presentation/router.provider.dart';
import 'package:tictactoe/domain/services/dialog.service.dart';
import 'package:tictactoe/foundation/routing/app_router.dart';

part 'dialog.service.provider.g.dart';

/// Dialog service provider
@Riverpod(keepAlive: true)
DialogService dialogService(Ref ref) {
  final AppRouter appRouter = ref.read(routerProvider);
  return DialogService(appRouter: appRouter);
}
