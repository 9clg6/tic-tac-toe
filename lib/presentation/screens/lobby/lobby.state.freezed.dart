// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lobby.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LobbyState {

 LobbyMode get mode; bool get isLoading; String get joinGameId; String? get lastCreatedGameId; String? get matchmakingRequestId; String? get matchedGameId; String? get errorMessage;
/// Create a copy of LobbyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LobbyStateCopyWith<LobbyState> get copyWith => _$LobbyStateCopyWithImpl<LobbyState>(this as LobbyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LobbyState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.joinGameId, joinGameId) || other.joinGameId == joinGameId)&&(identical(other.lastCreatedGameId, lastCreatedGameId) || other.lastCreatedGameId == lastCreatedGameId)&&(identical(other.matchmakingRequestId, matchmakingRequestId) || other.matchmakingRequestId == matchmakingRequestId)&&(identical(other.matchedGameId, matchedGameId) || other.matchedGameId == matchedGameId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,mode,isLoading,joinGameId,lastCreatedGameId,matchmakingRequestId,matchedGameId,errorMessage);

@override
String toString() {
  return 'LobbyState(mode: $mode, isLoading: $isLoading, joinGameId: $joinGameId, lastCreatedGameId: $lastCreatedGameId, matchmakingRequestId: $matchmakingRequestId, matchedGameId: $matchedGameId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LobbyStateCopyWith<$Res>  {
  factory $LobbyStateCopyWith(LobbyState value, $Res Function(LobbyState) _then) = _$LobbyStateCopyWithImpl;
@useResult
$Res call({
 LobbyMode mode, bool isLoading, String joinGameId, String? lastCreatedGameId, String? matchmakingRequestId, String? matchedGameId, String? errorMessage
});




}
/// @nodoc
class _$LobbyStateCopyWithImpl<$Res>
    implements $LobbyStateCopyWith<$Res> {
  _$LobbyStateCopyWithImpl(this._self, this._then);

  final LobbyState _self;
  final $Res Function(LobbyState) _then;

/// Create a copy of LobbyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? isLoading = null,Object? joinGameId = null,Object? lastCreatedGameId = freezed,Object? matchmakingRequestId = freezed,Object? matchedGameId = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as LobbyMode,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,joinGameId: null == joinGameId ? _self.joinGameId : joinGameId // ignore: cast_nullable_to_non_nullable
as String,lastCreatedGameId: freezed == lastCreatedGameId ? _self.lastCreatedGameId : lastCreatedGameId // ignore: cast_nullable_to_non_nullable
as String?,matchmakingRequestId: freezed == matchmakingRequestId ? _self.matchmakingRequestId : matchmakingRequestId // ignore: cast_nullable_to_non_nullable
as String?,matchedGameId: freezed == matchedGameId ? _self.matchedGameId : matchedGameId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LobbyState].
extension LobbyStatePatterns on LobbyState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LobbyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LobbyState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LobbyState value)  $default,){
final _that = this;
switch (_that) {
case _LobbyState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LobbyState value)?  $default,){
final _that = this;
switch (_that) {
case _LobbyState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LobbyMode mode,  bool isLoading,  String joinGameId,  String? lastCreatedGameId,  String? matchmakingRequestId,  String? matchedGameId,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LobbyState() when $default != null:
return $default(_that.mode,_that.isLoading,_that.joinGameId,_that.lastCreatedGameId,_that.matchmakingRequestId,_that.matchedGameId,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LobbyMode mode,  bool isLoading,  String joinGameId,  String? lastCreatedGameId,  String? matchmakingRequestId,  String? matchedGameId,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LobbyState():
return $default(_that.mode,_that.isLoading,_that.joinGameId,_that.lastCreatedGameId,_that.matchmakingRequestId,_that.matchedGameId,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LobbyMode mode,  bool isLoading,  String joinGameId,  String? lastCreatedGameId,  String? matchmakingRequestId,  String? matchedGameId,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LobbyState() when $default != null:
return $default(_that.mode,_that.isLoading,_that.joinGameId,_that.lastCreatedGameId,_that.matchmakingRequestId,_that.matchedGameId,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LobbyState extends LobbyState {
  const _LobbyState({this.mode = LobbyMode.local, this.isLoading = false, this.joinGameId = '', this.lastCreatedGameId, this.matchmakingRequestId, this.matchedGameId, this.errorMessage}): super._();
  

@override@JsonKey() final  LobbyMode mode;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  String joinGameId;
@override final  String? lastCreatedGameId;
@override final  String? matchmakingRequestId;
@override final  String? matchedGameId;
@override final  String? errorMessage;

/// Create a copy of LobbyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LobbyStateCopyWith<_LobbyState> get copyWith => __$LobbyStateCopyWithImpl<_LobbyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LobbyState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.joinGameId, joinGameId) || other.joinGameId == joinGameId)&&(identical(other.lastCreatedGameId, lastCreatedGameId) || other.lastCreatedGameId == lastCreatedGameId)&&(identical(other.matchmakingRequestId, matchmakingRequestId) || other.matchmakingRequestId == matchmakingRequestId)&&(identical(other.matchedGameId, matchedGameId) || other.matchedGameId == matchedGameId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,mode,isLoading,joinGameId,lastCreatedGameId,matchmakingRequestId,matchedGameId,errorMessage);

@override
String toString() {
  return 'LobbyState(mode: $mode, isLoading: $isLoading, joinGameId: $joinGameId, lastCreatedGameId: $lastCreatedGameId, matchmakingRequestId: $matchmakingRequestId, matchedGameId: $matchedGameId, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LobbyStateCopyWith<$Res> implements $LobbyStateCopyWith<$Res> {
  factory _$LobbyStateCopyWith(_LobbyState value, $Res Function(_LobbyState) _then) = __$LobbyStateCopyWithImpl;
@override @useResult
$Res call({
 LobbyMode mode, bool isLoading, String joinGameId, String? lastCreatedGameId, String? matchmakingRequestId, String? matchedGameId, String? errorMessage
});




}
/// @nodoc
class __$LobbyStateCopyWithImpl<$Res>
    implements _$LobbyStateCopyWith<$Res> {
  __$LobbyStateCopyWithImpl(this._self, this._then);

  final _LobbyState _self;
  final $Res Function(_LobbyState) _then;

/// Create a copy of LobbyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? isLoading = null,Object? joinGameId = null,Object? lastCreatedGameId = freezed,Object? matchmakingRequestId = freezed,Object? matchedGameId = freezed,Object? errorMessage = freezed,}) {
  return _then(_LobbyState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as LobbyMode,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,joinGameId: null == joinGameId ? _self.joinGameId : joinGameId // ignore: cast_nullable_to_non_nullable
as String,lastCreatedGameId: freezed == lastCreatedGameId ? _self.lastCreatedGameId : lastCreatedGameId // ignore: cast_nullable_to_non_nullable
as String?,matchmakingRequestId: freezed == matchmakingRequestId ? _self.matchmakingRequestId : matchmakingRequestId // ignore: cast_nullable_to_non_nullable
as String?,matchedGameId: freezed == matchedGameId ? _self.matchedGameId : matchedGameId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
