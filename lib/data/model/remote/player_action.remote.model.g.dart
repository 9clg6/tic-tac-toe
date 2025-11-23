// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_action.remote.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayerActionRemoteModel _$PlayerActionRemoteModelFromJson(
  Map<String, dynamic> json,
) => _PlayerActionRemoteModel(
  playerNumber: (json['playerNumber'] as num).toInt(),
  row: (json['row'] as num).toInt(),
  column: (json['column'] as num).toInt(),
  form: json['form'] as String,
);

Map<String, dynamic> _$PlayerActionRemoteModelToJson(
  _PlayerActionRemoteModel instance,
) => <String, dynamic>{
  'playerNumber': instance.playerNumber,
  'row': instance.row,
  'column': instance.column,
  'form': instance.form,
};
