import 'package:tictactoe/domain/entities/online_game_sync.entity.dart';
import 'package:tictactoe/domain/params/watch_online_game_sync.param.dart';
import 'package:tictactoe/domain/repositories/online_game_sync.repository.dart';
import 'package:tictactoe/foundation/interfaces/stream.usecases.dart';

/// Streams remote sync updates for an online game.
class WatchOnlineGameSyncUseCase extends StreamUseCaseWithParams<
    OnlineGameSyncEntity, WatchOnlineGameSyncParam> {
  /// Builds the use case using the provided sync [repository].
  WatchOnlineGameSyncUseCase({required OnlineGameSyncRepository repository})
    : _repository = repository;

  final OnlineGameSyncRepository _repository;

  @override
  Stream<OnlineGameSyncEntity> invoke(WatchOnlineGameSyncParam params) {
    return _repository.watchGame(params.gameId);
  }
}
