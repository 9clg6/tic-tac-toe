import 'package:tictactoe/domain/entities/player_action.entity.dart';
import 'package:tictactoe/domain/services/game.service.dart';
import 'package:tictactoe/domain/services/mixins/game_service.mixin.dart';

/// Handles offline/local matches without any remote sync.
final class LocalGameService with GameServiceMixin implements GameService {
  @override
  void disposeResourcesBeforeInit() {}

  @override
  void configureAfterInitialize() {}

  @override
  void handleActionPlayed(PlayerAction action) {}

  @override
  void cleanupOnDispose() {}
}
