// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'case_coordinates.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CaseCoordinates {

/// The row index of the cell.
 int get rowNumber;/// The column index of the cell.
 int get columnNumber;
/// Create a copy of CaseCoordinates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaseCoordinatesCopyWith<CaseCoordinates> get copyWith => _$CaseCoordinatesCopyWithImpl<CaseCoordinates>(this as CaseCoordinates, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaseCoordinates&&(identical(other.rowNumber, rowNumber) || other.rowNumber == rowNumber)&&(identical(other.columnNumber, columnNumber) || other.columnNumber == columnNumber));
}


@override
int get hashCode => Object.hash(runtimeType,rowNumber,columnNumber);

@override
String toString() {
  return 'CaseCoordinates(rowNumber: $rowNumber, columnNumber: $columnNumber)';
}


}

/// @nodoc
abstract mixin class $CaseCoordinatesCopyWith<$Res>  {
  factory $CaseCoordinatesCopyWith(CaseCoordinates value, $Res Function(CaseCoordinates) _then) = _$CaseCoordinatesCopyWithImpl;
@useResult
$Res call({
 int rowNumber, int columnNumber
});




}
/// @nodoc
class _$CaseCoordinatesCopyWithImpl<$Res>
    implements $CaseCoordinatesCopyWith<$Res> {
  _$CaseCoordinatesCopyWithImpl(this._self, this._then);

  final CaseCoordinates _self;
  final $Res Function(CaseCoordinates) _then;

/// Create a copy of CaseCoordinates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rowNumber = null,Object? columnNumber = null,}) {
  return _then(_self.copyWith(
rowNumber: null == rowNumber ? _self.rowNumber : rowNumber // ignore: cast_nullable_to_non_nullable
as int,columnNumber: null == columnNumber ? _self.columnNumber : columnNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CaseCoordinates].
extension CaseCoordinatesPatterns on CaseCoordinates {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaseCoordinates value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaseCoordinates() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaseCoordinates value)  $default,){
final _that = this;
switch (_that) {
case _CaseCoordinates():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaseCoordinates value)?  $default,){
final _that = this;
switch (_that) {
case _CaseCoordinates() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rowNumber,  int columnNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaseCoordinates() when $default != null:
return $default(_that.rowNumber,_that.columnNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rowNumber,  int columnNumber)  $default,) {final _that = this;
switch (_that) {
case _CaseCoordinates():
return $default(_that.rowNumber,_that.columnNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rowNumber,  int columnNumber)?  $default,) {final _that = this;
switch (_that) {
case _CaseCoordinates() when $default != null:
return $default(_that.rowNumber,_that.columnNumber);case _:
  return null;

}
}

}

/// @nodoc


class _CaseCoordinates implements CaseCoordinates {
  const _CaseCoordinates({required this.rowNumber, required this.columnNumber});
  

/// The row index of the cell.
@override final  int rowNumber;
/// The column index of the cell.
@override final  int columnNumber;

/// Create a copy of CaseCoordinates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaseCoordinatesCopyWith<_CaseCoordinates> get copyWith => __$CaseCoordinatesCopyWithImpl<_CaseCoordinates>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaseCoordinates&&(identical(other.rowNumber, rowNumber) || other.rowNumber == rowNumber)&&(identical(other.columnNumber, columnNumber) || other.columnNumber == columnNumber));
}


@override
int get hashCode => Object.hash(runtimeType,rowNumber,columnNumber);

@override
String toString() {
  return 'CaseCoordinates(rowNumber: $rowNumber, columnNumber: $columnNumber)';
}


}

/// @nodoc
abstract mixin class _$CaseCoordinatesCopyWith<$Res> implements $CaseCoordinatesCopyWith<$Res> {
  factory _$CaseCoordinatesCopyWith(_CaseCoordinates value, $Res Function(_CaseCoordinates) _then) = __$CaseCoordinatesCopyWithImpl;
@override @useResult
$Res call({
 int rowNumber, int columnNumber
});




}
/// @nodoc
class __$CaseCoordinatesCopyWithImpl<$Res>
    implements _$CaseCoordinatesCopyWith<$Res> {
  __$CaseCoordinatesCopyWithImpl(this._self, this._then);

  final _CaseCoordinates _self;
  final $Res Function(_CaseCoordinates) _then;

/// Create a copy of CaseCoordinates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rowNumber = null,Object? columnNumber = null,}) {
  return _then(_CaseCoordinates(
rowNumber: null == rowNumber ? _self.rowNumber : rowNumber // ignore: cast_nullable_to_non_nullable
as int,columnNumber: null == columnNumber ? _self.columnNumber : columnNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
