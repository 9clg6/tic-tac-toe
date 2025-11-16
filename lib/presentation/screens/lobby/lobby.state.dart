import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/foundation/enum/lobby.enum.dart';

part 'lobby.state.freezed.dart';

/// State of the lobby screen.
@freezed
abstract class LobbyState with _$LobbyState {
  /// Default constructor
  const factory LobbyState({
    @Default(LobbyMode.local) LobbyMode mode,
    @Default(false) bool isLoading,
    @Default('') String joinGameId,
    String? lastCreatedGameId,
    String? matchmakingRequestId,
    String? matchedGameId,
    String? errorMessage,
  }) = _LobbyState;

  const LobbyState._();

  /// Whether the input contains something usable to join a game.
  bool get canJoinGame => joinGameId.trim().isNotEmpty;
}
