import 'package:tictactoe/domain/params/delete_matchmaking_request.param.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/foundation/interfaces/future.usecases.dart';

/// Deletes a matchmaking request when consumed.
class DeleteMatchmakingRequestUseCase
    extends FutureUseCaseWithParams<void, DeleteMatchmakingRequestParam> {
  /// Creates an instance of [DeleteMatchmakingRequestUseCase] with 
  /// the given [OnlineRepository].
  DeleteMatchmakingRequestUseCase({required this.repository});

  /// The repository used to perform online operations, 
  /// such as deleting matchmaking requests.
  final OnlineRepository repository;

  @override
  Future<void> invoke(DeleteMatchmakingRequestParam params) {
    return repository.deleteMatchmakingRequest(params.requestId);
  }
}
