import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_kit/domain/services/game.service.dart';

part 'game.service.provider.g.dart';

/// Provides the singleton instance of [GameService].
@Riverpod(keepAlive: true)
GameService gameService(Ref ref) {
  final GameService service = GameService();
  ref.onDispose(service.dispose);
  return service;
}
