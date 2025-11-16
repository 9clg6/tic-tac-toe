import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/domain/entities/player.entity.dart';

part 'game_lobby.state.freezed.dart';

/// Game lobby screen state
@freezed
abstract class GameLobbyState with _$GameLobbyState {
  /// Constructor
  const factory GameLobbyState({
    required List<Player> players,
    @Default(<int, bool>{}) Map<int, bool> playersReady,
  }) = _GameLobbyState;

  const GameLobbyState._();

  /// Initial state with a default set of players ready to join the match
  factory GameLobbyState.initial() => GameLobbyState(
        players: List<Player>.generate(2, (int index) => Player(id: index)),
      );
}

/// Game lobby state extension
extension GameLobbyStateExtension on GameLobbyState {
  /// are all players ready
  bool get areAllPlayersReady =>
      playersReady.length == players.length &&
      playersReady.values.every((bool element) => element);
}
