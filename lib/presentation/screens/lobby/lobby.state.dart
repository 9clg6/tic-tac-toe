import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/domain/entities/player.entity.dart';

part 'lobby.state.freezed.dart';

/// Lobby screen state
@freezed
abstract class LobbyState with _$LobbyState {
  /// Constructor
  const factory LobbyState({
    required List<Player> players,
    @Default(<int, bool>{}) Map<int, bool> playersReady,
  }) = _LobbyState;

  const LobbyState._();

  /// Initial state with a default set of players ready to join the match
  factory LobbyState.initial() => LobbyState(
    players: List<Player>.generate(2, (int index) => Player(id: index)),
  );
}

/// Lobby state extension
extension LobbyStateExtension on LobbyState {
  /// are all players ready
  bool get areAllPlayersReady =>
      playersReady.length == players.length &&
      playersReady.values.every((bool element) => element);
}
