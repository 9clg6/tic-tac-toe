import 'dart:async';

import 'package:tictactoe/data/model/remote/player_action.remote.model.dart';
import 'package:tictactoe/domain/entities/online_game_sync.entity.dart';
import 'package:tictactoe/domain/entities/player_action.entity.dart';
import 'package:tictactoe/domain/params/append_online_game_action.param.dart';
import 'package:tictactoe/domain/params/clear_online_game_actions.param.dart';
import 'package:tictactoe/domain/params/watch_online_game_sync.param.dart';
import 'package:tictactoe/domain/services/game.service.dart';
import 'package:tictactoe/domain/services/mixins/game_service.mixin.dart';
import 'package:tictactoe/domain/usecases/append_online_game_action.use_case.dart';
import 'package:tictactoe/domain/usecases/clear_online_game_actions.use_case.dart';
import 'package:tictactoe/domain/usecases/watch_online_game_sync.use_case.dart';

/// Handles online games and synchronization.
final class OnlineGameService with GameServiceMixin implements GameService {
  /// Creates an [OnlineGameService] wired to the domain use cases.
  OnlineGameService({
    required AppendOnlineGameActionUseCase appendActionUseCase,
    required ClearOnlineGameActionsUseCase clearOnlineGameActionsUseCase,
    required WatchOnlineGameSyncUseCase watchOnlineGameSyncUseCase,
  }) : _appendActionUseCase = appendActionUseCase,
       _clearOnlineGameActionsUseCase = clearOnlineGameActionsUseCase,
       _watchOnlineGameSyncUseCase = watchOnlineGameSyncUseCase;

  final AppendOnlineGameActionUseCase _appendActionUseCase;
  final ClearOnlineGameActionsUseCase _clearOnlineGameActionsUseCase;
  final WatchOnlineGameSyncUseCase _watchOnlineGameSyncUseCase;
  StreamSubscription<OnlineGameSyncEntity>? _onlineGameSubscription;
  bool _isApplyingRemoteAction = false;
  int _syncedRemoteActions = 0;

  @override
  void disposeResourcesBeforeInit() {
    _stopOnlineSync();
    _syncedRemoteActions = 0;
  }

  @override
  void configureAfterInitialize() {
    if (isOnlineGame && onlineGameId != null) {
      _startOnlineSync();
    }
  }

  @override
  void handleActionPlayed(PlayerAction action) {
    if (!isOnlineGame || onlineGameId == null || _isApplyingRemoteAction) {
      return;
    }

    final Map<String, dynamic> payload = <String, dynamic>{
      ...PlayerActionRemoteModel.fromEntity(action).toJson(),
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };

    unawaited(
      _appendActionUseCase.invoke(
        AppendOnlineGameActionParam(gameId: onlineGameId!, action: payload),
      ),
    );
  }

  @override
  Future<void> resetOnlineGameState() async {
    if (!isOnlineGame || onlineGameId == null) {
      return;
    }
    await _clearOnlineGameActionsUseCase.invoke(
      ClearOnlineGameActionsParam(gameId: onlineGameId!),
    );
    _syncedRemoteActions = 0;
  }

  @override
  void cleanupOnDispose() {
    _stopOnlineSync();
  }

  void _startOnlineSync() {
    if (onlineGameId == null) return;
    _onlineGameSubscription = _watchOnlineGameSyncUseCase
        .invoke(WatchOnlineGameSyncParam(gameId: onlineGameId!))
        .listen(_handleRemoteGameUpdate);
  }

  void _handleRemoteGameUpdate(OnlineGameSyncEntity data) {
    final List<PlayerAction> actions = data.actions;
    if (actions.isEmpty) return;

    if (actions.length <= _syncedRemoteActions) return;
    final Iterable<PlayerAction> newActions = actions.skip(
      _syncedRemoteActions,
    );
    _applyRemoteHistory(newActions);
    _syncedRemoteActions = actions.length;
  }

  void _applyRemoteHistory(Iterable<PlayerAction> actions) {
    for (final PlayerAction action in actions) {
      final bool alreadyApplied = playerActionsHistory.any(
        (PlayerAction existing) =>
            existing.playerNumber == action.playerNumber &&
            existing.coordinates == action.coordinates,
      );
      if (alreadyApplied) continue;
      _isApplyingRemoteAction = true;
      setFormOnCoordinates(action);
      _isApplyingRemoteAction = false;
    }
  }

  void _stopOnlineSync() {
    _onlineGameSubscription?.cancel();
    _onlineGameSubscription = null;
    _syncedRemoteActions = 0;
  }
}
