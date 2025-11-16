import 'package:tictactoe/data/datasources/remote/matchmaking.remote.data_source.dart';
import 'package:tictactoe/data/datasources/remote/online_game.remote.data_source.dart';
import 'package:tictactoe/data/model/remote/matchmaking_request.remote.model.dart';
import 'package:tictactoe/data/model/remote/online_game.remote.model.dart';
import 'package:tictactoe/domain/entities/matchmaking_request.entity.dart';
import 'package:tictactoe/domain/entities/online_game.entity.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';

/// Implementation of [OnlineRepository].
final class OnlineRepositoryImpl implements OnlineRepository {
  /// Creates an [OnlineRepositoryImpl].
  OnlineRepositoryImpl({
    required OnlineGameRemoteDataSource gameRemoteDataSource,
    required MatchmakingRemoteDataSource matchmakingRemoteDataSource,
  }) : _gameRemoteDataSource = gameRemoteDataSource,
       _matchmakingRemoteDataSource = matchmakingRemoteDataSource;

  final OnlineGameRemoteDataSource _gameRemoteDataSource;
  final MatchmakingRemoteDataSource _matchmakingRemoteDataSource;

  @override
  /// Delegates creation to the remote data source and maps to entity.
  Future<OnlineGameEntity> createOnlineGame() async {
    final OnlineGameRemoteModel remote = await _gameRemoteDataSource
        .createGame();
    return remote.toEntity();
  }

  @override
  /// Fetches the requested game from Firestore.
  Future<OnlineGameEntity?> getOnlineGame(String id) async {
    final OnlineGameRemoteModel? remote = await _gameRemoteDataSource.getGame(
      id,
    );
    return remote?.toEntity();
  }

  @override
  /// Returns the oldest queued request (if any).
  Future<MatchmakingRequestEntity?> fetchOldestRequest() async {
    final MatchmakingRequestRemoteModel? remote =
        await _matchmakingRemoteDataSource.fetchOldestRequest();
    return remote?.toEntity();
  }

  @override
  /// Persists a new matchmaking request bound to the given game.
  Future<MatchmakingRequestEntity> createMatchmakingRequest(
    String gameId,
  ) async {
    final MatchmakingRequestRemoteModel remote =
        await _matchmakingRemoteDataSource.createRequest(gameId);
    return remote.toEntity();
  }

  @override
  /// Removes a matchmaking request once consumed.
  Future<void> deleteMatchmakingRequest(String requestId) {
    return _matchmakingRemoteDataSource.deleteRequest(requestId);
  }

  @override
  Future<int> claimNextPlayerSlot(String gameId) {
    return _gameRemoteDataSource.claimNextPlayerSlot(gameId);
  }

  @override
  Stream<bool> watchMatchmakingRequestConsumed(String requestId) {
    return _matchmakingRemoteDataSource.watchRequestConsumed(requestId);
  }
}
