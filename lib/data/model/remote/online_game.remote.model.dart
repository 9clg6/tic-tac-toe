import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/data/model/remote/converters/timestamp_converter.dart';
import 'package:tictactoe/data/model/remote/player_action.remote.model.dart';
import 'package:tictactoe/domain/entities/online_game.entity.dart';

part 'online_game.remote.model.freezed.dart';
part 'online_game.remote.model.g.dart';

/// Representation of the online game document stored in Firestore.
@freezed
abstract class OnlineGameRemoteModel with _$OnlineGameRemoteModel {
  /// Builds a model describing an online game.
  const factory OnlineGameRemoteModel({
    String? id,
    @TimestampConverter() DateTime? createdAt,
    @Default(<int>[]) List<int> players,
    @Default(0) int nextPlayerId,
    @Default(<PlayerActionRemoteModel>[]) List<PlayerActionRemoteModel> actions,
  }) = _OnlineGameRemoteModel;

  const OnlineGameRemoteModel._();

  /// From json
  factory OnlineGameRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$OnlineGameRemoteModelFromJson(json);

  /// Creates a model from Firestore raw data.
  factory OnlineGameRemoteModel.fromFirestore(
    String id,
    Map<String, dynamic> data,
  ) => OnlineGameRemoteModel.fromJson(data).copyWith(id: id);

  /// Default payload stored when creating a new online game.
  static Map<String, dynamic> creationPayload() => <String, dynamic>{
    'createdAt': FieldValue.serverTimestamp(),
    'actions': <Map<String, dynamic>>[],
    'players': <int>[0],
    'nextPlayerId': 1,
  };

  /// Maps the remote model to its domain entity.
  OnlineGameEntity toEntity() => OnlineGameEntity(
    id: id ?? '',
    createdAt: createdAt,
    playerIds: players,
    nextPlayerId: nextPlayerId,
    actions: actions.map((e) => e.toEntity()).toList(),
  );
}

/// Converts Firestore [Timestamp] objects into [DateTime] and vice-versa.
