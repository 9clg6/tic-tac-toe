import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/domain/entities/grid.entity.dart';

part 'home.state.freezed.dart';

/// Home state
@freezed
abstract class HomeState with _$HomeState {
  /// Constructor
  const factory HomeState({@Default(true) bool isLoading, Grid? grid}) =
      _HomeState;

  const HomeState._();

  /// Initial Constructor
  factory HomeState.initial({bool isLoading = true}) =>
      HomeState(isLoading: isLoading);
}
