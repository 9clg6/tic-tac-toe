import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/services/game.service.provider.dart';
import 'package:tictactoe/core/providers/services/navigation.service.provider.dart';
import 'package:tictactoe/domain/entities/player.entity.dart';
import 'package:tictactoe/domain/services/game.service.dart';
import 'package:tictactoe/presentation/screens/game_lobby/game_lobby.state.dart';

part 'game_lobby.view_model.g.dart';

/// Game lobby view model used to manage players before starting a match.
@riverpod
class GameLobbyViewModel extends _$GameLobbyViewModel {
  late final GameService _gameService;

  @override
  GameLobbyState build() {
    _gameService = ref.watch(gameServiceProvider);

    listenSelf((_, GameLobbyState next) {
      if (!next.areAllPlayersReady) return;
      Future<void>.delayed(const Duration(seconds: 3), () {
        ref.watch(navigationServiceProvider).navigateToHome();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state = GameLobbyState.initial();
        });
      });
    });

    return GameLobbyState.initial();
  }

  /// Adds a player placeholder into the lobby.
  void addPlayer() {
    final int nextId = _nextPlayerId();
    state = state.copyWith(
      players: List<Player>.unmodifiable(
        <Player>[...state.players, Player(id: nextId)],
      ),
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
