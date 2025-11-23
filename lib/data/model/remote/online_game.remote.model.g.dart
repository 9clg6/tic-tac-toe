// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_game.remote.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnlineGameRemoteModel _$OnlineGameRemoteModelFromJson(
  Map<String, dynamic> json,
) => _OnlineGameRemoteModel(
  id: json['id'] as String?,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  players:
      (json['players'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const <int>[],
  nextPlayerId: (json['nextPlayerId'] as num?)?.toInt() ?? 0,
  actions:
      (json['actions'] as List<dynamic>?)
          ?.map(
            (e) => PlayerActionRemoteModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <PlayerActionRemoteModel>[],
);

Map<String, dynamic> _$OnlineGameRemoteModelToJson(
  _OnlineGameRemoteModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'players': instance.players,
  'nextPlayerId': instance.nextPlayerId,
  'actions': instance.actions,
};
