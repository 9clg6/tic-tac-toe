import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/domain/entities/cell_coordinates.entity.dart';
import 'package:tictactoe/domain/entities/player_action.entity.dart';
import 'package:tictactoe/foundation/enum/form.enum.dart';

part 'player_action.remote.model.freezed.dart';
part 'player_action.remote.model.g.dart';

@freezed
abstract class PlayerActionRemoteModel with _$PlayerActionRemoteModel {
  const factory PlayerActionRemoteModel({
    required int playerNumber,
    required int row,
    required int column,
    required String form,
  }) = _PlayerActionRemoteModel;

  const PlayerActionRemoteModel._();

  factory PlayerActionRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerActionRemoteModelFromJson(json);

  factory PlayerActionRemoteModel.fromEntity(PlayerAction entity) {
    return PlayerActionRemoteModel(
      playerNumber: entity.playerNumber,
      row: entity.coordinates.rowNumber,
      column: entity.coordinates.columnNumber,
      form: entity.form.name,
    );
  }

  PlayerAction toEntity() {
    return PlayerAction(
      playerNumber: playerNumber,
      coordinates: CellCoordinates(rowNumber: row, columnNumber: column),
      form: Form.values.firstWhere(
        (Form e) => e.name == form,
        orElse: () => Form.cross,
      ),
    );
  }
}
