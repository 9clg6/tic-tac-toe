import 'package:tictactoe/domain/entities/online_game.entity.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/foundation/interfaces/future.usecases.dart';

/// Use case creating an online game record.
class CreateOnlineGameUseCase extends FutureUseCase<OnlineGameEntity> {
  /// Creates a [CreateOnlineGameUseCase] with the given [repository]
  /// to handle online game creation.
  CreateOnlineGameUseCase({required this.repository});

  /// The repository responsible for handling online game data operations.
  final OnlineRepository repository;

  @override
  Future<OnlineGameEntity> invoke() {
    return repository.createOnlineGame();
  }
}
