import 'package:tictactoe/domain/entities/online_game.entity.dart';
import 'package:tictactoe/domain/params/get_online_game.param.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/foundation/interfaces/future.usecases.dart';

/// Use case retrieving a specific online game.
class GetOnlineGameUseCase
    extends FutureUseCaseWithParams<OnlineGameEntity?, GetOnlineGameParam> {
  /// Creates a [GetOnlineGameUseCase] with the provided [OnlineRepository].
  GetOnlineGameUseCase({required this.repository});

  /// Online repository, allow to handle serialization 
  final OnlineRepository repository;

  @override
  Future<OnlineGameEntity?> invoke(GetOnlineGameParam params) {
    return repository.getOnlineGame(params.gameId);
  }
}
