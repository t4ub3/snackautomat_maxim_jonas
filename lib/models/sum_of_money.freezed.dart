// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sum_of_money.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SumOfMoney {

 int get count200ct; int get count100ct; int get count50ct; int get count20ct; int get count10ct; int get count5ct;
/// Create a copy of SumOfMoney
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SumOfMoneyCopyWith<SumOfMoney> get copyWith => _$SumOfMoneyCopyWithImpl<SumOfMoney>(this as SumOfMoney, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SumOfMoney&&(identical(other.count200ct, count200ct) || other.count200ct == count200ct)&&(identical(other.count100ct, count100ct) || other.count100ct == count100ct)&&(identical(other.count50ct, count50ct) || other.count50ct == count50ct)&&(identical(other.count20ct, count20ct) || other.count20ct == count20ct)&&(identical(other.count10ct, count10ct) || other.count10ct == count10ct)&&(identical(other.count5ct, count5ct) || other.count5ct == count5ct));
}


@override
int get hashCode => Object.hash(runtimeType,count200ct,count100ct,count50ct,count20ct,count10ct,count5ct);

@override
String toString() {
  return 'SumOfMoney(count200ct: $count200ct, count100ct: $count100ct, count50ct: $count50ct, count20ct: $count20ct, count10ct: $count10ct, count5ct: $count5ct)';
}


}

/// @nodoc
abstract mixin class $SumOfMoneyCopyWith<$Res>  {
  factory $SumOfMoneyCopyWith(SumOfMoney value, $Res Function(SumOfMoney) _then) = _$SumOfMoneyCopyWithImpl;
@useResult
$Res call({
 int count200ct, int count100ct, int count50ct, int count20ct, int count10ct, int count5ct
});




}
/// @nodoc
class _$SumOfMoneyCopyWithImpl<$Res>
    implements $SumOfMoneyCopyWith<$Res> {
  _$SumOfMoneyCopyWithImpl(this._self, this._then);

  final SumOfMoney _self;
  final $Res Function(SumOfMoney) _then;

/// Create a copy of SumOfMoney
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count200ct = null,Object? count100ct = null,Object? count50ct = null,Object? count20ct = null,Object? count10ct = null,Object? count5ct = null,}) {
  return _then(_self.copyWith(
count200ct: null == count200ct ? _self.count200ct : count200ct // ignore: cast_nullable_to_non_nullable
as int,count100ct: null == count100ct ? _self.count100ct : count100ct // ignore: cast_nullable_to_non_nullable
as int,count50ct: null == count50ct ? _self.count50ct : count50ct // ignore: cast_nullable_to_non_nullable
as int,count20ct: null == count20ct ? _self.count20ct : count20ct // ignore: cast_nullable_to_non_nullable
as int,count10ct: null == count10ct ? _self.count10ct : count10ct // ignore: cast_nullable_to_non_nullable
as int,count5ct: null == count5ct ? _self.count5ct : count5ct // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SumOfMoney].
extension SumOfMoneyPatterns on SumOfMoney {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SumOfMoney value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SumOfMoney() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SumOfMoney value)  $default,){
final _that = this;
switch (_that) {
case _SumOfMoney():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SumOfMoney value)?  $default,){
final _that = this;
switch (_that) {
case _SumOfMoney() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count200ct,  int count100ct,  int count50ct,  int count20ct,  int count10ct,  int count5ct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SumOfMoney() when $default != null:
return $default(_that.count200ct,_that.count100ct,_that.count50ct,_that.count20ct,_that.count10ct,_that.count5ct);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count200ct,  int count100ct,  int count50ct,  int count20ct,  int count10ct,  int count5ct)  $default,) {final _that = this;
switch (_that) {
case _SumOfMoney():
return $default(_that.count200ct,_that.count100ct,_that.count50ct,_that.count20ct,_that.count10ct,_that.count5ct);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count200ct,  int count100ct,  int count50ct,  int count20ct,  int count10ct,  int count5ct)?  $default,) {final _that = this;
switch (_that) {
case _SumOfMoney() when $default != null:
return $default(_that.count200ct,_that.count100ct,_that.count50ct,_that.count20ct,_that.count10ct,_that.count5ct);case _:
  return null;

}
}

}

/// @nodoc


class _SumOfMoney extends SumOfMoney {
  const _SumOfMoney({required this.count200ct, required this.count100ct, required this.count50ct, required this.count20ct, required this.count10ct, required this.count5ct}): super._();
  

@override final  int count200ct;
@override final  int count100ct;
@override final  int count50ct;
@override final  int count20ct;
@override final  int count10ct;
@override final  int count5ct;

/// Create a copy of SumOfMoney
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SumOfMoneyCopyWith<_SumOfMoney> get copyWith => __$SumOfMoneyCopyWithImpl<_SumOfMoney>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SumOfMoney&&(identical(other.count200ct, count200ct) || other.count200ct == count200ct)&&(identical(other.count100ct, count100ct) || other.count100ct == count100ct)&&(identical(other.count50ct, count50ct) || other.count50ct == count50ct)&&(identical(other.count20ct, count20ct) || other.count20ct == count20ct)&&(identical(other.count10ct, count10ct) || other.count10ct == count10ct)&&(identical(other.count5ct, count5ct) || other.count5ct == count5ct));
}


@override
int get hashCode => Object.hash(runtimeType,count200ct,count100ct,count50ct,count20ct,count10ct,count5ct);

@override
String toString() {
  return 'SumOfMoney(count200ct: $count200ct, count100ct: $count100ct, count50ct: $count50ct, count20ct: $count20ct, count10ct: $count10ct, count5ct: $count5ct)';
}


}

/// @nodoc
abstract mixin class _$SumOfMoneyCopyWith<$Res> implements $SumOfMoneyCopyWith<$Res> {
  factory _$SumOfMoneyCopyWith(_SumOfMoney value, $Res Function(_SumOfMoney) _then) = __$SumOfMoneyCopyWithImpl;
@override @useResult
$Res call({
 int count200ct, int count100ct, int count50ct, int count20ct, int count10ct, int count5ct
});




}
/// @nodoc
class __$SumOfMoneyCopyWithImpl<$Res>
    implements _$SumOfMoneyCopyWith<$Res> {
  __$SumOfMoneyCopyWithImpl(this._self, this._then);

  final _SumOfMoney _self;
  final $Res Function(_SumOfMoney) _then;

/// Create a copy of SumOfMoney
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count200ct = null,Object? count100ct = null,Object? count50ct = null,Object? count20ct = null,Object? count10ct = null,Object? count5ct = null,}) {
  return _then(_SumOfMoney(
count200ct: null == count200ct ? _self.count200ct : count200ct // ignore: cast_nullable_to_non_nullable
as int,count100ct: null == count100ct ? _self.count100ct : count100ct // ignore: cast_nullable_to_non_nullable
as int,count50ct: null == count50ct ? _self.count50ct : count50ct // ignore: cast_nullable_to_non_nullable
as int,count20ct: null == count20ct ? _self.count20ct : count20ct // ignore: cast_nullable_to_non_nullable
as int,count10ct: null == count10ct ? _self.count10ct : count10ct // ignore: cast_nullable_to_non_nullable
as int,count5ct: null == count5ct ? _self.count5ct : count5ct // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
