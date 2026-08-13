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

 List<Coin> get coins;
/// Create a copy of SumOfMoney
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SumOfMoneyCopyWith<SumOfMoney> get copyWith => _$SumOfMoneyCopyWithImpl<SumOfMoney>(this as SumOfMoney, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SumOfMoney&&const DeepCollectionEquality().equals(other.coins, coins));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(coins));

@override
String toString() {
  return 'SumOfMoney(coins: $coins)';
}


}

/// @nodoc
abstract mixin class $SumOfMoneyCopyWith<$Res>  {
  factory $SumOfMoneyCopyWith(SumOfMoney value, $Res Function(SumOfMoney) _then) = _$SumOfMoneyCopyWithImpl;
@useResult
$Res call({
 List<Coin> coins
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
@pragma('vm:prefer-inline') @override $Res call({Object? coins = null,}) {
  return _then(_self.copyWith(
coins: null == coins ? _self.coins : coins // ignore: cast_nullable_to_non_nullable
as List<Coin>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Coin> coins)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SumOfMoney() when $default != null:
return $default(_that.coins);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Coin> coins)  $default,) {final _that = this;
switch (_that) {
case _SumOfMoney():
return $default(_that.coins);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Coin> coins)?  $default,) {final _that = this;
switch (_that) {
case _SumOfMoney() when $default != null:
return $default(_that.coins);case _:
  return null;

}
}

}

/// @nodoc


class _SumOfMoney implements SumOfMoney {
  const _SumOfMoney({required final  List<Coin> coins}): _coins = coins;
  

 final  List<Coin> _coins;
@override List<Coin> get coins {
  if (_coins is EqualUnmodifiableListView) return _coins;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coins);
}


/// Create a copy of SumOfMoney
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SumOfMoneyCopyWith<_SumOfMoney> get copyWith => __$SumOfMoneyCopyWithImpl<_SumOfMoney>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SumOfMoney&&const DeepCollectionEquality().equals(other._coins, _coins));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_coins));

@override
String toString() {
  return 'SumOfMoney(coins: $coins)';
}


}

/// @nodoc
abstract mixin class _$SumOfMoneyCopyWith<$Res> implements $SumOfMoneyCopyWith<$Res> {
  factory _$SumOfMoneyCopyWith(_SumOfMoney value, $Res Function(_SumOfMoney) _then) = __$SumOfMoneyCopyWithImpl;
@override @useResult
$Res call({
 List<Coin> coins
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
@override @pragma('vm:prefer-inline') $Res call({Object? coins = null,}) {
  return _then(_SumOfMoney(
coins: null == coins ? _self._coins : coins // ignore: cast_nullable_to_non_nullable
as List<Coin>,
  ));
}


}

// dart format on
