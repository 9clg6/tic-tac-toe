import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/data/model/remote/converters/timestamp_converter.dart';
import 'package:tictactoe/domain/entities/matchmaking_request.entity.dart';

part 'matchmaking_request.remote.model.freezed.dart';
part 'matchmaking_request.remote.model.g.dart';

/// Firestore representation of a matchmaking request.
@freezed
abstract class MatchmakingRequestRemoteModel
    with _$MatchmakingRequestRemoteModel {
  /// Creates a [MatchmakingRequestRemoteModel].
  ///
  /// [gameId] is the ID of the game this request belongs to (required).
  /// [id] is the Firestore document ID
  ///   (automatically assigned, not serialized).
  /// [createdAt] is the timestamp when the request was created
  ///   (normally set by Firestore).
  const factory MatchmakingRequestRemoteModel({
    required String gameId,
    String? id,
    @TimestampConverter() DateTime? createdAt,
  }) = _MatchmakingRequestRemoteModel;

  const MatchmakingRequestRemoteModel._();

  /// From json
  factory MatchmakingRequestRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$MatchmakingRequestRemoteModelFromJson(json);

  /// Creates a model from Firestore raw data.
  factory MatchmakingRequestRemoteModel.fromFirestore(
    String id,
    Map<String, dynamic> data,
  ) => MatchmakingRequestRemoteModel.fromJson(data).copyWith(id: id);

  /// Payload used when enqueuing a matchmaking request.
  static Map<String, dynamic> creationPayload(String gameId) =>
      <String, dynamic>{
        'gameId': gameId,
        'createdAt': FieldValue.serverTimestamp(),
      };

  /// Maps this remote model to its domain entity.
  MatchmakingRequestEntity toEntity() => MatchmakingRequestEntity(
    id: id ?? '',
    gameId: gameId,
    createdAt: createdAt,
  );
}
