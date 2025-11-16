import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/services/navigation.service.provider.dart';
import 'package:tictactoe/core/providers/services/online.service.provider.dart';
import 'package:tictactoe/domain/services/online.service.dart';
import 'package:tictactoe/foundation/enum/lobby.enum.dart';
import 'package:tictactoe/presentation/screens/lobby/lobby.state.dart';

part 'lobby.view_model.g.dart';

/// Handles lobby interactions while delegating business logic to services.
@riverpod
class LobbyViewModel extends _$LobbyViewModel {
  StreamSubscription<bool>? _requestSubscription;

  @override
  LobbyState build() {
    ref.onDispose(() {
      _requestSubscription?.cancel();
    });
    return const LobbyState();
  }

  /// Select the current mode.
  void selectMode(LobbyMode mode) {
    state = state.copyWith(
      mode: mode,
      errorMessage: null,
      matchedGameId: null,
      matchmakingRequestId: null,
    );
  }

  /// Update join game id input.
  void updateJoinGameId(String value) {
    state = state.copyWith(joinGameId: value);
  }

  /// Creates a new online game.
  Future<void> createGame() async {
    await _executeWithService((OnlineService service) async {
      final OnlineGameSession session = await service.createGame();
      state = state.copyWith(
        lastCreatedGameId: session.gameId,
        matchmakingRequestId: session.matchmakingRequestId,
        matchedGameId: session.gameId,
      );
      if (session.matchmakingRequestId != null) {
        _listenForMatchmakingRequest(service, session.matchmakingRequestId!);
      } else {
        _navigateToGame();
      }
    });
  }

  /// Join an existing online game via identifier.
  Future<void> joinGameById() async {
    if (!state.canJoinGame) {
      state = state.copyWith(
        errorMessage: 'join_id_required',
        matchedGameId: null,
      );
      return;
    }

    await _executeWithService((OnlineService service) async {
      final OnlineGameSession game = await service.joinGameById(
        state.joinGameId.trim(),
      );
      state = state.copyWith(
        matchedGameId: game.gameId,
        matchmakingRequestId: null,
        lastCreatedGameId: null,
      );
      _cancelRequestListener();
      _navigateToGame();
    });
  }

  /// Searches an opponent using matchmaking.
  Future<void> searchMatchmaking() async {
    await _executeWithService((OnlineService service) async {
      final OnlineMatchmakingResult result = await service.searchMatchmaking();
      state = state.copyWith(
        matchedGameId: result.matchedGameId,
        matchmakingRequestId: null,
        lastCreatedGameId: null,
      );
      _cancelRequestListener();
      _navigateToGame();
    });
  }

  /// Wraps calls to [OnlineService] by handling loading/error states.
  Future<void> _executeWithService(
    Future<void> Function(OnlineService service) runner,
  ) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final OnlineService service = await ref.watch(
        onlineServiceProvider.future,
      );
      await runner(service);
    } on OnlineException catch (error) {
      state = state.copyWith(errorMessage: error.code);
    } on Exception catch (error) {
      state = state.copyWith(errorMessage: error.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void _navigateToGame() {
    ref.watch(navigationServiceProvider).navigateToHome();
  }

  void _listenForMatchmakingRequest(OnlineService service, String requestId) {
    _requestSubscription?.cancel();
    _requestSubscription = service.watchMatchmakingRequest(requestId).listen((
      bool consumed,
    ) {
      if (!consumed) return;
      _requestSubscription?.cancel();
      _requestSubscription = null;
      state = state.copyWith(matchmakingRequestId: null);
      _navigateToGame();
    });
  }

  void _cancelRequestListener() {
    _requestSubscription?.cancel();
    _requestSubscription = null;
  }
}
