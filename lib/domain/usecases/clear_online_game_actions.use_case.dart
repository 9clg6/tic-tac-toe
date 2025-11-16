import 'package:tictactoe/domain/params/clear_online_game_actions.param.dart';
import 'package:tictactoe/domain/repositories/online_game_sync.repository.dart';
import 'package:tictactoe/foundation/interfaces/future.usecases.dart';

/// Clears all recorded actions for a given online game.
class ClearOnlineGameActionsUseCase extends FutureUseCaseWithParams<
    void, ClearOnlineGameActionsParam> {
  /// Builds the use case using the provided sync [repository].
  ClearOnlineGameActionsUseCase({required OnlineGameSyncRepository repository})
    : _repository = repository;

  final OnlineGameSyncRepository _repository;

  @override
  Future<void> invoke(ClearOnlineGameActionsParam params) {
    return _repository.clearActions(params.gameId);
  }
}
