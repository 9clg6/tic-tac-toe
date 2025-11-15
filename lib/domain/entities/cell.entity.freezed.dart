// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cell.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Cell {

 CellCoordinates get coordinates; Form get form;
/// Create a copy of Cell
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CellCopyWith<Cell> get copyWith => _$CellCopyWithImpl<Cell>(this as Cell, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cell&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,coordinates,form);



}

/// @nodoc
abstract mixin class $CellCopyWith<$Res>  {
  factory $CellCopyWith(Cell value, $Res Function(Cell) _then) = _$CellCopyWithImpl;
@useResult
$Res call({
 CellCoordinates coordinates, Form form
});


$CellCoordinatesCopyWith<$Res> get coordinates;

}
/// @nodoc
class _$CellCopyWithImpl<$Res>
    implements $CellCopyWith<$Res> {
  _$CellCopyWithImpl(this._self, this._then);

  final Cell _self;
  final $Res Function(Cell) _then;

/// Create a copy of Cell
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coordinates = null,Object? form = null,}) {
  return _then(_self.copyWith(
coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as CellCoordinates,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as Form,
  ));
}
/// Create a copy of Cell
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CellCoordinatesCopyWith<$Res> get coordinates {
  
  return $CellCoordinatesCopyWith<$Res>(_self.coordinates, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}


/// Adds pattern-matching-related methods to [Cell].
extension CellPatterns on Cell {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cell value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cell() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cell value)  $default,){
final _that = this;
switch (_that) {
case _Cell():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cell value)?  $default,){
final _that = this;
switch (_that) {
case _Cell() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CellCoordinates coordinates,  Form form)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cell() when $default != null:
return $default(_that.coordinates,_that.form);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CellCoordinates coordinates,  Form form)  $default,) {final _that = this;
switch (_that) {
case _Cell():
return $default(_that.coordinates,_that.form);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CellCoordinates coordinates,  Form form)?  $default,) {final _that = this;
switch (_that) {
case _Cell() when $default != null:
return $default(_that.coordinates,_that.form);case _:
  return null;

}
}

}

/// @nodoc


class _Cell implements Cell {
  const _Cell({required this.coordinates, required this.form});
  

@override final  CellCoordinates coordinates;
@override final  Form form;

/// Create a copy of Cell
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CellCopyWith<_Cell> get copyWith => __$CellCopyWithImpl<_Cell>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cell&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,coordinates,form);



}

/// @nodoc
abstract mixin class _$CellCopyWith<$Res> implements $CellCopyWith<$Res> {
  factory _$CellCopyWith(_Cell value, $Res Function(_Cell) _then) = __$CellCopyWithImpl;
@override @useResult
$Res call({
 CellCoordinates coordinates, Form form
});


@override $CellCoordinatesCopyWith<$Res> get coordinates;

}
/// @nodoc
class __$CellCopyWithImpl<$Res>
    implements _$CellCopyWith<$Res> {
  __$CellCopyWithImpl(this._self, this._then);

  final _Cell _self;
  final $Res Function(_Cell) _then;

/// Create a copy of Cell
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coordinates = null,Object? form = null,}) {
  return _then(_Cell(
coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as CellCoordinates,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as Form,
  ));
}

/// Create a copy of Cell
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CellCoordinatesCopyWith<$Res> get coordinates {
  
  return $CellCoordinatesCopyWith<$Res>(_self.coordinates, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}

// dart format on
