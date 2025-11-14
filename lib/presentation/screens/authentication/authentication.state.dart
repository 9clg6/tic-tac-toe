import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication.state.freezed.dart';

/// Authentication State
@freezed
abstract class AuthenticationState with _$AuthenticationState {
  /// constructor
  const factory AuthenticationState({
    @Default(false) bool loading,
    @Default(false) bool isPasswordVisible,
  }) = _AuthenticationState;

  const AuthenticationState._();

  /// initial
  factory AuthenticationState.initial() => const AuthenticationState();
}
