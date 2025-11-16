// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matchmaking_request.remote.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchmakingRequestRemoteModel {

 String get gameId; String? get id;@TimestampConverter() DateTime? get createdAt;
/// Create a copy of MatchmakingRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchmakingRequestRemoteModelCopyWith<MatchmakingRequestRemoteModel> get copyWith => _$MatchmakingRequestRemoteModelCopyWithImpl<MatchmakingRequestRemoteModel>(this as MatchmakingRequestRemoteModel, _$identity);

  /// Serializes this MatchmakingRequestRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchmakingRequestRemoteModel&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameId,id,createdAt);

@override
String toString() {
  return 'MatchmakingRequestRemoteModel(gameId: $gameId, id: $id, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MatchmakingRequestRemoteModelCopyWith<$Res>  {
  factory $MatchmakingRequestRemoteModelCopyWith(MatchmakingRequestRemoteModel value, $Res Function(MatchmakingRequestRemoteModel) _then) = _$MatchmakingRequestRemoteModelCopyWithImpl;
@useResult
$Res call({
 String gameId, String? id,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class _$MatchmakingRequestRemoteModelCopyWithImpl<$Res>
    implements $MatchmakingRequestRemoteModelCopyWith<$Res> {
  _$MatchmakingRequestRemoteModelCopyWithImpl(this._self, this._then);

  final MatchmakingRequestRemoteModel _self;
  final $Res Function(MatchmakingRequestRemoteModel) _then;

/// Create a copy of MatchmakingRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gameId = null,Object? id = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchmakingRequestRemoteModel].
extension MatchmakingRequestRemoteModelPatterns on MatchmakingRequestRemoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchmakingRequestRemoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchmakingRequestRemoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchmakingRequestRemoteModel value)  $default,){
final _that = this;
switch (_that) {
case _MatchmakingRequestRemoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchmakingRequestRemoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatchmakingRequestRemoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String gameId,  String? id, @TimestampConverter()  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchmakingRequestRemoteModel() when $default != null:
return $default(_that.gameId,_that.id,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String gameId,  String? id, @TimestampConverter()  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _MatchmakingRequestRemoteModel():
return $default(_that.gameId,_that.id,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String gameId,  String? id, @TimestampConverter()  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MatchmakingRequestRemoteModel() when $default != null:
return $default(_that.gameId,_that.id,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchmakingRequestRemoteModel extends MatchmakingRequestRemoteModel {
  const _MatchmakingRequestRemoteModel({required this.gameId, this.id, @TimestampConverter() this.createdAt}): super._();
  factory _MatchmakingRequestRemoteModel.fromJson(Map<String, dynamic> json) => _$MatchmakingRequestRemoteModelFromJson(json);

@override final  String gameId;
@override final  String? id;
@override@TimestampConverter() final  DateTime? createdAt;

/// Create a copy of MatchmakingRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchmakingRequestRemoteModelCopyWith<_MatchmakingRequestRemoteModel> get copyWith => __$MatchmakingRequestRemoteModelCopyWithImpl<_MatchmakingRequestRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchmakingRequestRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchmakingRequestRemoteModel&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameId,id,createdAt);

@override
String toString() {
  return 'MatchmakingRequestRemoteModel(gameId: $gameId, id: $id, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MatchmakingRequestRemoteModelCopyWith<$Res> implements $MatchmakingRequestRemoteModelCopyWith<$Res> {
  factory _$MatchmakingRequestRemoteModelCopyWith(_MatchmakingRequestRemoteModel value, $Res Function(_MatchmakingRequestRemoteModel) _then) = __$MatchmakingRequestRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 String gameId, String? id,@TimestampConverter() DateTime? createdAt
});




}
/// @nodoc
class __$MatchmakingRequestRemoteModelCopyWithImpl<$Res>
    implements _$MatchmakingRequestRemoteModelCopyWith<$Res> {
  __$MatchmakingRequestRemoteModelCopyWithImpl(this._self, this._then);

  final _MatchmakingRequestRemoteModel _self;
  final $Res Function(_MatchmakingRequestRemoteModel) _then;

/// Create a copy of MatchmakingRequestRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gameId = null,Object? id = freezed,Object? createdAt = freezed,}) {
  return _then(_MatchmakingRequestRemoteModel(
gameId: null == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
