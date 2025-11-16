// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_lobby.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameLobbyState {

 List<Player> get players; Map<int, bool> get playersReady;
/// Create a copy of GameLobbyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameLobbyStateCopyWith<GameLobbyState> get copyWith => _$GameLobbyStateCopyWithImpl<GameLobbyState>(this as GameLobbyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameLobbyState&&const DeepCollectionEquality().equals(other.players, players)&&const DeepCollectionEquality().equals(other.playersReady, playersReady));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(players),const DeepCollectionEquality().hash(playersReady));

@override
String toString() {
  return 'GameLobbyState(players: $players, playersReady: $playersReady)';
}


}

/// @nodoc
abstract mixin class $GameLobbyStateCopyWith<$Res>  {
  factory $GameLobbyStateCopyWith(GameLobbyState value, $Res Function(GameLobbyState) _then) = _$GameLobbyStateCopyWithImpl;
@useResult
$Res call({
 List<Player> players, Map<int, bool> playersReady
});




}
/// @nodoc
class _$GameLobbyStateCopyWithImpl<$Res>
    implements $GameLobbyStateCopyWith<$Res> {
  _$GameLobbyStateCopyWithImpl(this._self, this._then);

  final GameLobbyState _self;
  final $Res Function(GameLobbyState) _then;

/// Create a copy of GameLobbyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? players = null,Object? playersReady = null,}) {
  return _then(_self.copyWith(
players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as List<Player>,playersReady: null == playersReady ? _self.playersReady : playersReady // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,
  ));
}

}


/// Adds pattern-matching-related methods to [GameLobbyState].
extension GameLobbyStatePatterns on GameLobbyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameLobbyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameLobbyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameLobbyState value)  $default,){
final _that = this;
switch (_that) {
case _GameLobbyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameLobbyState value)?  $default,){
final _that = this;
switch (_that) {
case _GameLobbyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Player> players,  Map<int, bool> playersReady)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameLobbyState() when $default != null:
return $default(_that.players,_that.playersReady);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Player> players,  Map<int, bool> playersReady)  $default,) {final _that = this;
switch (_that) {
case _GameLobbyState():
return $default(_that.players,_that.playersReady);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Player> players,  Map<int, bool> playersReady)?  $default,) {final _that = this;
switch (_that) {
case _GameLobbyState() when $default != null:
return $default(_that.players,_that.playersReady);case _:
  return null;

}
}

}

/// @nodoc


class _GameLobbyState extends GameLobbyState {
  const _GameLobbyState({required final  List<Player> players, final  Map<int, bool> playersReady = const <int, bool>{}}): _players = players,_playersReady = playersReady,super._();
  

 final  List<Player> _players;
@override List<Player> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}

 final  Map<int, bool> _playersReady;
@override@JsonKey() Map<int, bool> get playersReady {
  if (_playersReady is EqualUnmodifiableMapView) return _playersReady;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_playersReady);
}


/// Create a copy of GameLobbyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameLobbyStateCopyWith<_GameLobbyState> get copyWith => __$GameLobbyStateCopyWithImpl<_GameLobbyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameLobbyState&&const DeepCollectionEquality().equals(other._players, _players)&&const DeepCollectionEquality().equals(other._playersReady, _playersReady));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_players),const DeepCollectionEquality().hash(_playersReady));

@override
String toString() {
  return 'GameLobbyState(players: $players, playersReady: $playersReady)';
}


}

/// @nodoc
abstract mixin class _$GameLobbyStateCopyWith<$Res> implements $GameLobbyStateCopyWith<$Res> {
  factory _$GameLobbyStateCopyWith(_GameLobbyState value, $Res Function(_GameLobbyState) _then) = __$GameLobbyStateCopyWithImpl;
@override @useResult
$Res call({
 List<Player> players, Map<int, bool> playersReady
});




}
/// @nodoc
class __$GameLobbyStateCopyWithImpl<$Res>
    implements _$GameLobbyStateCopyWith<$Res> {
  __$GameLobbyStateCopyWithImpl(this._self, this._then);

  final _GameLobbyState _self;
  final $Res Function(_GameLobbyState) _then;

/// Create a copy of GameLobbyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? players = null,Object? playersReady = null,}) {
  return _then(_GameLobbyState(
players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<Player>,playersReady: null == playersReady ? _self._playersReady : playersReady // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,
  ));
}


}

// dart format on
