import 'package:tictactoe/domain/params/watch_matchmaking_request.param.dart';
import 'package:tictactoe/domain/repositories/online.repository.dart';
import 'package:tictactoe/foundation/interfaces/stream.usecases.dart';

/// Streams updates indicating when a matchmaking request has been consumed.
class WatchMatchmakingRequestUseCase
    extends StreamUseCaseWithParams<bool, WatchMatchmakingRequestParam> {
  /// Creates an instance of [WatchMatchmakingRequestUseCase].
  ///
  /// [repository] is the [OnlineRepository] used to stream
  /// matchmaking request updates.
  WatchMatchmakingRequestUseCase({required this.repository});

  /// The [OnlineRepository] instance used to stream matchmaking queue updates.
  final OnlineRepository repository;

  @override
  Stream<bool> invoke(WatchMatchmakingRequestParam params) {
    return repository.watchMatchmakingRequestConsumed(params.requestId);
  }
}
