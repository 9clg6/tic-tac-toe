import 'package:tictactoe/domain/entities/matchmaking_request.entity.dart';
import 'package:tictactoe/domain/entities/online_game.entity.dart';
import 'package:tictactoe/domain/params/claim_next_player_slot.param.dart';
import 'package:tictactoe/domain/params/create_matchmaking_request.param.dart';
import 'package:tictactoe/domain/params/delete_matchmaking_request.param.dart';
import 'package:tictactoe/domain/params/get_online_game.param.dart';
import 'package:tictactoe/domain/params/watch_matchmaking_request.param.dart';
import 'package:tictactoe/domain/services/game.service.dart';
import 'package:tictactoe/domain/usecases/claim_next_player_slot.use_case.dart';
import 'package:tictactoe/domain/usecases/create_matchmaking_request.use_case.dart';
import 'package:tictactoe/domain/usecases/create_online_game.use_case.dart';
import 'package:tictactoe/domain/usecases/delete_matchmaking_request.use_case.dart';
import 'package:tictactoe/domain/usecases/fetch_oldest_matchmaking_request.use_case.dart';
import 'package:tictactoe/domain/usecases/get_online_game.use_case.dart';
import 'package:tictactoe/domain/usecases/watch_matchmaking_request.use_case.dart';

/// Encapsulates matchmaking logic and bridges it with [GameService].
class OnlineService {
  /// Provides documentation for the OnlineService class.
  ///
  /// The [OnlineService] class encapsulates logic for
  /// online matchmaking and game session
  /// management in the TicTacToe domain. It serves as a bridge
  ///  between high-level
  /// matchmaking use cases (such as creating and deleting requests,
  /// claiming player slots,
  /// and observing request state) and the core game logic handled
  /// by [GameService].
  ///
  /// Responsibilities:
  /// - Creating and managing online game sessions
  /// - Creating, watching, and deleting matchmaking requests
  /// - Claiming player slots for online game joins
  /// - Coordinating with [GameService] to initialize local game state
  ///
  /// Dependencies (all injected via constructor):
  /// - [GameService] for local game logic
  /// - [CreateOnlineGameUseCase], [GetOnlineGameUseCase], and others
  /// for use case-level logic
  ///
  /// Typical Usage:
  ///   final onlineService = OnlineService(
  ///     gameService: ...,
  ///     createOnlineGameUseCase: ...,
  ///     getOnlineGameUseCase: ...,
  ///     fetchOldestMatchmakingRequestUseCase: ...,
  ///     createMatchmakingRequestUseCase: ...,
  ///     deleteMatchmakingRequestUseCase: ...,
  ///     claimNextPlayerSlotUseCase: ...,
  ///     watchMatchmakingRequestUseCase: ...,
  ///   );
  ///   final session = await onlineService.createGame();
  OnlineService({
    required GameService gameService,
    required CreateOnlineGameUseCase createOnlineGameUseCase,
    required GetOnlineGameUseCase getOnlineGameUseCase,
    required FetchOldestMatchmakingRequestUseCase
    fetchOldestMatchmakingRequestUseCase,
    required CreateMatchmakingRequestUseCase createMatchmakingRequestUseCase,
    required DeleteMatchmakingRequestUseCase deleteMatchmakingRequestUseCase,
    required ClaimNextPlayerSlotUseCase claimNextPlayerSlotUseCase,
    required WatchMatchmakingRequestUseCase watchMatchmakingRequestUseCase,
  }) : _gameService = gameService,
       _createOnlineGameUseCase = createOnlineGameUseCase,
       _getOnlineGameUseCase = getOnlineGameUseCase,
       _fetchOldestMatchmakingRequestUseCase =
           fetchOldestMatchmakingRequestUseCase,
       _createMatchmakingRequestUseCase = createMatchmakingRequestUseCase,
       _deleteMatchmakingRequestUseCase = deleteMatchmakingRequestUseCase,
       _claimNextPlayerSlotUseCase = claimNextPlayerSlotUseCase,
       _watchMatchmakingRequestUseCase = watchMatchmakingRequestUseCase;

  final GameService _gameService;
  final CreateOnlineGameUseCase _createOnlineGameUseCase;
  final GetOnlineGameUseCase _getOnlineGameUseCase;
  final FetchOldestMatchmakingRequestUseCase
  _fetchOldestMatchmakingRequestUseCase;
  final CreateMatchmakingRequestUseCase _createMatchmakingRequestUseCase;
  final DeleteMatchmakingRequestUseCase _deleteMatchmakingRequestUseCase;
  final ClaimNextPlayerSlotUseCase _claimNextPlayerSlotUseCase;
  final WatchMatchmakingRequestUseCase _watchMatchmakingRequestUseCase;

  /// Creates a fresh online game and prepares the local board.
  Future<OnlineGameSession> createGame() async {
    final OnlineGameEntity game = await _createOnlineGameUseCase.invoke();
    const int localPlayerId = 0;
    _gameService.initialize(isOnlineGame: true, onlineGameId: game.id);

    final MatchmakingRequestEntity request =
        await _createMatchmakingRequestUseCase.invoke(
          CreateMatchmakingRequestParam(gameId: game.id),
        );

    return OnlineGameSession(
      gameId: game.id,
      localPlayerId: localPlayerId,
      matchmakingRequestId: request.id,
    );
  }

  /// Ensures the game exists before joining and resets the local board.
  Future<OnlineGameSession> joinGameById(String gameId) async {
    final OnlineGameEntity? game = await _getOnlineGameUseCase.invoke(
      GetOnlineGameParam(gameId: gameId),
    );
    if (game == null) {
      throw const OnlineException('game_not_found');
    }
    final int localPlayerId = await _claimNextPlayerSlotUseCase.invoke(
      ClaimNextPlayerSlotParam(gameId: gameId),
    );
    _gameService.initialize(
      isOnlineGame: true,
      localPlayerId: localPlayerId,
      onlineGameId: game.id,
    );
    return OnlineGameSession(gameId: game.id, localPlayerId: localPlayerId);
  }

  /// Searches for an opponent using a simple FIFO queue strategy.
  Future<OnlineMatchmakingResult> searchMatchmaking() async {
    final MatchmakingRequestEntity? oldestRequest =
        await _fetchOldestMatchmakingRequestUseCase.invoke();

    if (oldestRequest == null) {
      throw const OnlineException('no_request_available');
    }

    final OnlineGameSession session = await joinGameById(oldestRequest.gameId);
    await _deleteMatchmakingRequestUseCase.invoke(
      DeleteMatchmakingRequestParam(requestId: oldestRequest.id),
    );
    return OnlineMatchmakingResult(matchedGameId: session.gameId);
  }

  /// Watches the matchmaking request and emits `true` when consumed.
  Stream<bool> watchMatchmakingRequest(String requestId) {
    return _watchMatchmakingRequestUseCase.invoke(
      WatchMatchmakingRequestParam(requestId: requestId),
    );
  }
}

/// Summary of an online game session for the local player.
/// Represents a summary of the current online game
/// session for the local player.
///
/// [gameId] - The identifier for the joined or created online game.
/// [localPlayerId] - The ID assigned to the local player for this game.
/// [matchmakingRequestId] - An optional request ID for the
/// matchmaking process, if used.
class OnlineGameSession {
  /// Creates an immutable object reprensenting the current
  /// online game session state.
  const OnlineGameSession({
    required this.gameId,
    required this.localPlayerId,
    this.matchmakingRequestId,
  });

  /// The identifier for the joined or created online game.
  final String gameId;

  /// The local player's ID for this game session.
  final int localPlayerId;

  /// Optional: The request used for matchmaking,
  /// if this session originated from matchmaking.
  final String? matchmakingRequestId;
}

/// Represents the output of a matchmaking search.
class OnlineMatchmakingResult {
  /// Summary of the result from a matchmaking request.
  ///
  /// [matchedGameId] - The identifier of a matched opponent's game,
  /// if a match was made.
  /// [matchmakingRequestId] - The identifier of the matchmaking request,
  /// if still in queue.
  /// [createdGameId] - The identifier of the newly created game when enqueued.
  const OnlineMatchmakingResult({
    this.matchedGameId,
    this.matchmakingRequestId,
    this.createdGameId,
  });

  /// Game identifier of the opponent you matched with.
  final String? matchedGameId;

  /// Request identifier if you are waiting in queue.
  final String? matchmakingRequestId;

  /// Newly created game id when enqueued.
  final String? createdGameId;
}

/// Lightweight exception used to pass typed errors to the presentation layer.
class OnlineException implements Exception {
  /// Creates an [OnlineException] with a specific error [code].
  const OnlineException(this.code);

  /// Localization/error code.
  final String code;
}
