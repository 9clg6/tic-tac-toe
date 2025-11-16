import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/services/game.service.provider.dart';
import 'package:tictactoe/core/providers/services/navigation.service.provider.dart';
import 'package:tictactoe/domain/entities/player.entity.dart';
import 'package:tictactoe/domain/services/game.service.dart';
import 'package:tictactoe/presentation/screens/lobby/lobby.state.dart';

part 'lobby.view_model.g.dart';

/// Lobby view model used to manage players before starting a match.
@riverpod
class LobbyViewModel extends _$LobbyViewModel {
  late final GameService _gameService;

  @override
  LobbyState build() {
    _gameService = ref.watch(gameServiceProvider);

    listenSelf((_, LobbyState next) {
      if (!next.areAllPlayersReady) return;
      Future<void>.delayed(const Duration(seconds: 3), () {
        ref.watch(navigationServiceProvider).navigateToHome();
      });
    });

    return LobbyState.initial();
  }

  /// Adds a player placeholder into the lobby.
  void addPlayer() {
    final int nextId = _nextPlayerId();
    state = state.copyWith(
      players: List<Player>.unmodifiable(<Player>[
        ...state.players,
        Player(id: nextId),
      ]),
    );
  }

  /// Removes a player from the lobby if more than two players remain.
  void removePlayer(int playerId) {
    if (state.players.length <= 2) return;
    state = state.copyWith(
      players: List<Player>.unmodifiable(
        state.players.where((Player player) => player.id != playerId).toList(),
      ),
    );
  }

  /// Starts the game using the configured number of players.
  void startGame() {
    _gameService.initialize(playersAmount: state.players.length);
  }

  int _nextPlayerId() {
    if (state.players.isEmpty) return 0;
    return state.players.map((Player player) => player.id).reduce(max) + 1;
  }

  /// Set player ready
  void setPlayerReady(int id) {
    final Map<int, bool> updatedPlayersReady = Map<int, bool>.from(
      state.playersReady,
    );

    updatedPlayersReady[id] = !(state.playersReady[id] ?? false);

    state = state.copyWith(playersReady: updatedPlayersReady);
  }
}
