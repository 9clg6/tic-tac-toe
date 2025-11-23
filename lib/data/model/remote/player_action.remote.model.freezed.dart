// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_action.remote.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerActionRemoteModel {

 int get playerNumber; int get row; int get column; String get form;
/// Create a copy of PlayerActionRemoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerActionRemoteModelCopyWith<PlayerActionRemoteModel> get copyWith => _$PlayerActionRemoteModelCopyWithImpl<PlayerActionRemoteModel>(this as PlayerActionRemoteModel, _$identity);

  /// Serializes this PlayerActionRemoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerActionRemoteModel&&(identical(other.playerNumber, playerNumber) || other.playerNumber == playerNumber)&&(identical(other.row, row) || other.row == row)&&(identical(other.column, column) || other.column == column)&&(identical(other.form, form) || other.form == form));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerNumber,row,column,form);

@override
String toString() {
  return 'PlayerActionRemoteModel(playerNumber: $playerNumber, row: $row, column: $column, form: $form)';
}


}

/// @nodoc
abstract mixin class $PlayerActionRemoteModelCopyWith<$Res>  {
  factory $PlayerActionRemoteModelCopyWith(PlayerActionRemoteModel value, $Res Function(PlayerActionRemoteModel) _then) = _$PlayerActionRemoteModelCopyWithImpl;
@useResult
$Res call({
 int playerNumber, int row, int column, String form
});




}
/// @nodoc
class _$PlayerActionRemoteModelCopyWithImpl<$Res>
    implements $PlayerActionRemoteModelCopyWith<$Res> {
  _$PlayerActionRemoteModelCopyWithImpl(this._self, this._then);

  final PlayerActionRemoteModel _self;
  final $Res Function(PlayerActionRemoteModel) _then;

/// Create a copy of PlayerActionRemoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerNumber = null,Object? row = null,Object? column = null,Object? form = null,}) {
  return _then(_self.copyWith(
playerNumber: null == playerNumber ? _self.playerNumber : playerNumber // ignore: cast_nullable_to_non_nullable
as int,row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,column: null == column ? _self.column : column // ignore: cast_nullable_to_non_nullable
as int,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerActionRemoteModel].
extension PlayerActionRemoteModelPatterns on PlayerActionRemoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerActionRemoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerActionRemoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerActionRemoteModel value)  $default,){
final _that = this;
switch (_that) {
case _PlayerActionRemoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerActionRemoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerActionRemoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int playerNumber,  int row,  int column,  String form)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerActionRemoteModel() when $default != null:
return $default(_that.playerNumber,_that.row,_that.column,_that.form);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int playerNumber,  int row,  int column,  String form)  $default,) {final _that = this;
switch (_that) {
case _PlayerActionRemoteModel():
return $default(_that.playerNumber,_that.row,_that.column,_that.form);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int playerNumber,  int row,  int column,  String form)?  $default,) {final _that = this;
switch (_that) {
case _PlayerActionRemoteModel() when $default != null:
return $default(_that.playerNumber,_that.row,_that.column,_that.form);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerActionRemoteModel extends PlayerActionRemoteModel {
  const _PlayerActionRemoteModel({required this.playerNumber, required this.row, required this.column, required this.form}): super._();
  factory _PlayerActionRemoteModel.fromJson(Map<String, dynamic> json) => _$PlayerActionRemoteModelFromJson(json);

@override final  int playerNumber;
@override final  int row;
@override final  int column;
@override final  String form;

/// Create a copy of PlayerActionRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerActionRemoteModelCopyWith<_PlayerActionRemoteModel> get copyWith => __$PlayerActionRemoteModelCopyWithImpl<_PlayerActionRemoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerActionRemoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerActionRemoteModel&&(identical(other.playerNumber, playerNumber) || other.playerNumber == playerNumber)&&(identical(other.row, row) || other.row == row)&&(identical(other.column, column) || other.column == column)&&(identical(other.form, form) || other.form == form));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerNumber,row,column,form);

@override
String toString() {
  return 'PlayerActionRemoteModel(playerNumber: $playerNumber, row: $row, column: $column, form: $form)';
}


}

/// @nodoc
abstract mixin class _$PlayerActionRemoteModelCopyWith<$Res> implements $PlayerActionRemoteModelCopyWith<$Res> {
  factory _$PlayerActionRemoteModelCopyWith(_PlayerActionRemoteModel value, $Res Function(_PlayerActionRemoteModel) _then) = __$PlayerActionRemoteModelCopyWithImpl;
@override @useResult
$Res call({
 int playerNumber, int row, int column, String form
});




}
/// @nodoc
class __$PlayerActionRemoteModelCopyWithImpl<$Res>
    implements _$PlayerActionRemoteModelCopyWith<$Res> {
  __$PlayerActionRemoteModelCopyWithImpl(this._self, this._then);

  final _PlayerActionRemoteModel _self;
  final $Res Function(_PlayerActionRemoteModel) _then;

/// Create a copy of PlayerActionRemoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerNumber = null,Object? row = null,Object? column = null,Object? form = null,}) {
  return _then(_PlayerActionRemoteModel(
playerNumber: null == playerNumber ? _self.playerNumber : playerNumber // ignore: cast_nullable_to_non_nullable
as int,row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,column: null == column ? _self.column : column // ignore: cast_nullable_to_non_nullable
as int,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
