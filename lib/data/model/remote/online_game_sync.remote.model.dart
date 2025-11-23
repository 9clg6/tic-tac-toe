import 'package:tictactoe/data/model/remote/player_action.remote.model.dart';
import 'package:tictactoe/domain/entities/online_game_sync.entity.dart';
import 'package:tictactoe/domain/entities/player_action.entity.dart';

/// Remote representation of the game sync document.
class OnlineGameSyncRemoteModel {
  /// Builds a remote model containing the list of recorded [actions].
  const OnlineGameSyncRemoteModel({required this.actions});

  /// Creates a remote model from the raw Firestore payload.
  factory OnlineGameSyncRemoteModel.fromFirestore(Map<String, dynamic> data) {
    final List<dynamic> rawActions =
        data['actions'] as List<dynamic>? ?? const <dynamic>[];

    final List<PlayerAction> parsedActions = rawActions
        .whereType<Map<String, dynamic>>()
        .map(PlayerActionRemoteModel.fromJson)
        .map((PlayerActionRemoteModel e) => e.toEntity())
        .toList(growable: false);
    return OnlineGameSyncRemoteModel(actions: parsedActions);
  }

  /// Actions recorded remotely.
  final List<PlayerAction> actions;

  /// Maps this remote model to the domain entity.
  OnlineGameSyncEntity toEntity() => OnlineGameSyncEntity(actions: actions);
}
