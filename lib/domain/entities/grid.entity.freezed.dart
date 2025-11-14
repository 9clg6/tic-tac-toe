// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Grid {

 Map<int, Row> get grid; int get columnsRowsAmount;
/// Create a copy of Grid
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GridCopyWith<Grid> get copyWith => _$GridCopyWithImpl<Grid>(this as Grid, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Grid&&const DeepCollectionEquality().equals(other.grid, grid)&&(identical(other.columnsRowsAmount, columnsRowsAmount) || other.columnsRowsAmount == columnsRowsAmount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(grid),columnsRowsAmount);

@override
String toString() {
  return 'Grid(grid: $grid, columnsRowsAmount: $columnsRowsAmount)';
}


}

/// @nodoc
abstract mixin class $GridCopyWith<$Res>  {
  factory $GridCopyWith(Grid value, $Res Function(Grid) _then) = _$GridCopyWithImpl;
@useResult
$Res call({
 Map<int, Row> grid, int columnsRowsAmount
});




}
/// @nodoc
class _$GridCopyWithImpl<$Res>
    implements $GridCopyWith<$Res> {
  _$GridCopyWithImpl(this._self, this._then);

  final Grid _self;
  final $Res Function(Grid) _then;

/// Create a copy of Grid
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? grid = null,Object? columnsRowsAmount = null,}) {
  return _then(_self.copyWith(
grid: null == grid ? _self.grid : grid // ignore: cast_nullable_to_non_nullable
as Map<int, Row>,columnsRowsAmount: null == columnsRowsAmount ? _self.columnsRowsAmount : columnsRowsAmount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Grid].
extension GridPatterns on Grid {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Grid value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Grid() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Grid value)  $default,){
final _that = this;
switch (_that) {
case _Grid():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Grid value)?  $default,){
final _that = this;
switch (_that) {
case _Grid() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<int, Row> grid,  int columnsRowsAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Grid() when $default != null:
return $default(_that.grid,_that.columnsRowsAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<int, Row> grid,  int columnsRowsAmount)  $default,) {final _that = this;
switch (_that) {
case _Grid():
return $default(_that.grid,_that.columnsRowsAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<int, Row> grid,  int columnsRowsAmount)?  $default,) {final _that = this;
switch (_that) {
case _Grid() when $default != null:
return $default(_that.grid,_that.columnsRowsAmount);case _:
  return null;

}
}

}

/// @nodoc


class _Grid implements Grid {
  const _Grid({required final  Map<int, Row> grid, required this.columnsRowsAmount}): _grid = grid;
  

 final  Map<int, Row> _grid;
@override Map<int, Row> get grid {
  if (_grid is EqualUnmodifiableMapView) return _grid;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_grid);
}

@override final  int columnsRowsAmount;

/// Create a copy of Grid
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GridCopyWith<_Grid> get copyWith => __$GridCopyWithImpl<_Grid>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Grid&&const DeepCollectionEquality().equals(other._grid, _grid)&&(identical(other.columnsRowsAmount, columnsRowsAmount) || other.columnsRowsAmount == columnsRowsAmount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_grid),columnsRowsAmount);

@override
String toString() {
  return 'Grid(grid: $grid, columnsRowsAmount: $columnsRowsAmount)';
}


}

/// @nodoc
abstract mixin class _$GridCopyWith<$Res> implements $GridCopyWith<$Res> {
  factory _$GridCopyWith(_Grid value, $Res Function(_Grid) _then) = __$GridCopyWithImpl;
@override @useResult
$Res call({
 Map<int, Row> grid, int columnsRowsAmount
});




}
/// @nodoc
class __$GridCopyWithImpl<$Res>
    implements _$GridCopyWith<$Res> {
  __$GridCopyWithImpl(this._self, this._then);

  final _Grid _self;
  final $Res Function(_Grid) _then;

/// Create a copy of Grid
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? grid = null,Object? columnsRowsAmount = null,}) {
  return _then(_Grid(
grid: null == grid ? _self._grid : grid // ignore: cast_nullable_to_non_nullable
as Map<int, Row>,columnsRowsAmount: null == columnsRowsAmount ? _self.columnsRowsAmount : columnsRowsAmount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
