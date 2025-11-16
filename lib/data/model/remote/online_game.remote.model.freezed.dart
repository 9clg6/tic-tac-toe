// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_game.remote.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnlineGameRemoteModel {

 String? get id;@TimestampConverter() DateTime? get createdAt; List<int> get players; int get nextPlayerId;
/// Create a copy of OnlineGameRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnlineGameRemoteModelCopyWith<OnlineGameRemoteModel> get copyWith => _$OnlineGameRemoteModelCopyWithImpl<OnlineGameRemoteModel>(this as OnlineGameRemoteModel, _$identity);

  /// Serializes this OnlineGameRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnlineGameRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.players, players)&&(identical(other.nextPlayerId, nextPlayerId) || other.nextPlayerId == nextPlayerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,const DeepCollectionEquality().hash(players),nextPlayerId);

@override
String toString() {
  return 'OnlineGameRemoteModel(id: $id, createdAt: $createdAt, players: $players, nextPlayerId: $nextPlayerId)';
}


}

/// @nodoc
abstract mixin class $OnlineGameRemoteModelCopyWith<$Res>  {
  factory $OnlineGameRemoteModelCopyWith(OnlineGameRemoteModel value, $Res Function(OnlineGameRemoteModel) _then) = _$OnlineGameRemoteModelCopyWithImpl;
@useResult
$Res call({
 String? id,@TimestampConverter() DateTime? createdAt, List<int> players, int nextPlayerId
});




}
/// @nodoc
class _$OnlineGameRemoteModelCopyWithImpl<$Res>
    implements $OnlineGameRemoteModelCopyWith<$Res> {
  _$OnlineGameRemoteModelCopyWithImpl(this._self, this._then);

  final OnlineGameRemoteModel _self;
  final $Res Function(OnlineGameRemoteModel) _then;

/// Create a copy of OnlineGameRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? players = null,Object? nextPlayerId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as List<int>,nextPlayerId: null == nextPlayerId ? _self.nextPlayerId : nextPlayerId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OnlineGameRemoteModel].
extension OnlineGameRemoteModelPatterns on OnlineGameRemoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnlineGameRemoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnlineGameRemoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnlineGameRemoteModel value)  $default,){
final _that = this;
switch (_that) {
case _OnlineGameRemoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnlineGameRemoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _OnlineGameRemoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @TimestampConverter()  DateTime? createdAt,  List<int> players,  int nextPlayerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnlineGameRemoteModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.players,_that.nextPlayerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @TimestampConverter()  DateTime? createdAt,  List<int> players,  int nextPlayerId)  $default,) {final _that = this;
switch (_that) {
case _OnlineGameRemoteModel():
return $default(_that.id,_that.createdAt,_that.players,_that.nextPlayerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @TimestampConverter()  DateTime? createdAt,  List<int> players,  int nextPlayerId)?  $default,) {final _that = this;
switch (_that) {
case _OnlineGameRemoteModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.players,_that.nextPlayerId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnlineGameRemoteModel extends OnlineGameRemoteModel {
  const _OnlineGameRemoteModel({this.id, @TimestampConverter() this.createdAt, final  List<int> players = const <int>[], this.nextPlayerId = 0}): _players = players,super._();
  factory _OnlineGameRemoteModel.fromJson(Map<String, dynamic> json) => _$OnlineGameRemoteModelFromJson(json);

@override final  String? id;
@override@TimestampConverter() final  DateTime? createdAt;
 final  List<int> _players;
@override@JsonKey() List<int> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}

@override@JsonKey() final  int nextPlayerId;

/// Create a copy of OnlineGameRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnlineGameRemoteModelCopyWith<_OnlineGameRemoteModel> get copyWith => __$OnlineGameRemoteModelCopyWithImpl<_OnlineGameRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnlineGameRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnlineGameRemoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._players, _players)&&(identical(other.nextPlayerId, nextPlayerId) || other.nextPlayerId == nextPlayerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,const DeepCollectionEquality().hash(_players),nextPlayerId);

@override
String toString() {
  return 'OnlineGameRemoteModel(id: $id, createdAt: $createdAt, players: $players, nextPlayerId: $nextPlayerId)';
}


}

/// @nodoc
abstract mixin class _$OnlineGameRemoteModelCopyWith<$Res> implements $OnlineGameRemoteModelCopyWith<$Res> {
  factory _$OnlineGameRemoteModelCopyWith(_OnlineGameRemoteModel value, $Res Function(_OnlineGameRemoteModel) _then) = __$OnlineGameRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@TimestampConverter() DateTime? createdAt, List<int> players, int nextPlayerId
});




}
/// @nodoc
class __$OnlineGameRemoteModelCopyWithImpl<$Res>
    implements _$OnlineGameRemoteModelCopyWith<$Res> {
  __$OnlineGameRemoteModelCopyWithImpl(this._self, this._then);

  final _OnlineGameRemoteModel _self;
  final $Res Function(_OnlineGameRemoteModel) _then;

/// Create a copy of OnlineGameRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? players = null,Object? nextPlayerId = null,}) {
  return _then(_OnlineGameRemoteModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<int>,nextPlayerId: null == nextPlayerId ? _self.nextPlayerId : nextPlayerId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
