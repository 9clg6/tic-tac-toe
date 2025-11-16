import 'package:tictactoe/data/model/remote/matchmaking_request.remote.model.dart';

/// Remote data source to manage matchmaking requests.
abstract class MatchmakingRemoteDataSource {
  /// Returns the oldest request waiting in the queue (if any).
  Future<MatchmakingRequestRemoteModel?> fetchOldestRequest();

  /// Creates a request pointing to the provided [gameId].
  Future<MatchmakingRequestRemoteModel> createRequest(String gameId);

  /// Removes a request once a match is found.
  Future<void> deleteRequest(String requestId);

  /// Emits `true` once the request has been consumed (deleted).
  Stream<bool> watchRequestConsumed(String requestId);
}
