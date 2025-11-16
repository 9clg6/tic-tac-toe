import 'package:tictactoe/domain/entities/matchmaking_request.entity.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/foundation/interfaces/future.usecases.dart';

/// Retrieves the first matchmaking request waiting in queue.
class FetchOldestMatchmakingRequestUseCase
    extends FutureUseCase<MatchmakingRequestEntity?> {
  /// Creates a new instance of [FetchOldestMatchmakingRequestUseCase].
  ///
  /// [repository] The repository used to fetch the oldest matchmaking request.
  FetchOldestMatchmakingRequestUseCase({required this.repository});

  /// The repository used to interact with the 
  /// online matchmaking request source.
  final OnlineRepository repository;

  @override
  Future<MatchmakingRequestEntity?> invoke() {
    return repository.fetchOldestRequest();
  }
}
