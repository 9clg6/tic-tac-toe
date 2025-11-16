import 'package:tictactoe/domain/params/append_online_game_action.param.dart';
import 'package:tictactoe/domain/repositories/online_game_sync.repository.dart';
import 'package:tictactoe/foundation/interfaces/future.usecases.dart';

/// Appends a serialized action to an online game's remote history.
class AppendOnlineGameActionUseCase extends FutureUseCaseWithParams<
    void, AppendOnlineGameActionParam> {
  /// Builds the use case with the given sync [repository].
  AppendOnlineGameActionUseCase({required OnlineGameSyncRepository repository})
    : _repository = repository;

  final OnlineGameSyncRepository _repository;

  @override
  Future<void> invoke(AppendOnlineGameActionParam params) {
    return _repository.appendAction(params.gameId, params.action);
  }
}
