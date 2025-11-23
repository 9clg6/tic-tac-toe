import 'package:tictactoe/domain/entities/player_action.entity.dart';

/// Snapshot of the remote online game document.
class OnlineGameSyncEntity {
  /// Creates a snapshot with the list of recorded [actions].
  const OnlineGameSyncEntity({required this.actions});

  /// All player actions recorded remotely.
  final List<PlayerAction> actions;
}
