// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchmaking_request.remote.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchmakingRequestRemoteModel _$MatchmakingRequestRemoteModelFromJson(
  Map<String, dynamic> json,
) => _MatchmakingRequestRemoteModel(
  gameId: json['gameId'] as String,
  id: json['id'] as String?,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$MatchmakingRequestRemoteModelToJson(
  _MatchmakingRequestRemoteModel instance,
) => <String, dynamic>{
  'gameId': instance.gameId,
  'id': instance.id,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};
