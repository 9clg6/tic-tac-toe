import 'package:tictactoe/domain/entities/matchmaking_request.entity.dart';
import 'package:tictactoe/domain/params/create_matchmaking_request.param.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/foundation/interfaces/future.usecases.dart';

/// Creates a matchmaking request for a given game.
class CreateMatchmakingRequestUseCase
    extends
        FutureUseCaseWithParams<
          MatchmakingRequestEntity,
          CreateMatchmakingRequestParam
        > {
  /// Creates an instance of [CreateMatchmakingRequestUseCase].
  ///
  /// The [repository] parameter is required and provides the methods
  /// needed to interact with the online matchmaking request system.
  CreateMatchmakingRequestUseCase({required this.repository});

  /// Provides methods to interact with the online matchmaking system.
  final OnlineRepository repository;

  @override
  Future<MatchmakingRequestEntity> invoke(
    CreateMatchmakingRequestParam params,
  ) {
    return repository.createMatchmakingRequest(params.gameId);
  }
}
