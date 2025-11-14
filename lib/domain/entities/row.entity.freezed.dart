// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'row.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Row {

 Map<int, Cell> get columns;
/// Create a copy of Row
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RowCopyWith<Row> get copyWith => _$RowCopyWithImpl<Row>(this as Row, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Row&&const DeepCollectionEquality().equals(other.columns, columns));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(columns));

@override
String toString() {
  return 'Row(columns: $columns)';
}


}

/// @nodoc
abstract mixin class $RowCopyWith<$Res>  {
  factory $RowCopyWith(Row value, $Res Function(Row) _then) = _$RowCopyWithImpl;
@useResult
$Res call({
 Map<int, Cell> columns
});




}
/// @nodoc
class _$RowCopyWithImpl<$Res>
    implements $RowCopyWith<$Res> {
  _$RowCopyWithImpl(this._self, this._then);

  final Row _self;
  final $Res Function(Row) _then;

/// Create a copy of Row
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? columns = null,}) {
  return _then(_self.copyWith(
columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as Map<int, Cell>,
  ));
}

}


/// Adds pattern-matching-related methods to [Row].
extension RowPatterns on Row {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Row value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Row() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Row value)  $default,){
final _that = this;
switch (_that) {
case _Row():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Row value)?  $default,){
final _that = this;
switch (_that) {
case _Row() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<int, Cell> columns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Row() when $default != null:
return $default(_that.columns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<int, Cell> columns)  $default,) {final _that = this;
switch (_that) {
case _Row():
return $default(_that.columns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<int, Cell> columns)?  $default,) {final _that = this;
switch (_that) {
case _Row() when $default != null:
return $default(_that.columns);case _:
  return null;

}
}

}

/// @nodoc


class _Row implements Row {
  const _Row({required final  Map<int, Cell> columns}): _columns = columns;
  

 final  Map<int, Cell> _columns;
@override Map<int, Cell> get columns {
  if (_columns is EqualUnmodifiableMapView) return _columns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_columns);
}


/// Create a copy of Row
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RowCopyWith<_Row> get copyWith => __$RowCopyWithImpl<_Row>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Row&&const DeepCollectionEquality().equals(other._columns, _columns));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_columns));

@override
String toString() {
  return 'Row(columns: $columns)';
}


}

/// @nodoc
abstract mixin class _$RowCopyWith<$Res> implements $RowCopyWith<$Res> {
  factory _$RowCopyWith(_Row value, $Res Function(_Row) _then) = __$RowCopyWithImpl;
@override @useResult
$Res call({
 Map<int, Cell> columns
});




}
/// @nodoc
class __$RowCopyWithImpl<$Res>
    implements _$RowCopyWith<$Res> {
  __$RowCopyWithImpl(this._self, this._then);

  final _Row _self;
  final $Res Function(_Row) _then;

/// Create a copy of Row
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? columns = null,}) {
  return _then(_Row(
columns: null == columns ? _self._columns : columns // ignore: cast_nullable_to_non_nullable
as Map<int, Cell>,
  ));
}


}

// dart format on
