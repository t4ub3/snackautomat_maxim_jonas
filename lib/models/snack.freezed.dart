// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snack.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Snack implements DiagnosticableTreeMixin {

 int? get id; String get name; double get price; File? get image;
/// Create a copy of Snack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnackCopyWith<Snack> get copyWith => _$SnackCopyWithImpl<Snack>(this as Snack, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Snack'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('image', image));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Snack&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price,image);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Snack(id: $id, name: $name, price: $price, image: $image)';
}


}

/// @nodoc
abstract mixin class $SnackCopyWith<$Res>  {
  factory $SnackCopyWith(Snack value, $Res Function(Snack) _then) = _$SnackCopyWithImpl;
@useResult
$Res call({
 int? id, String name, double price, File? image
});




}
/// @nodoc
class _$SnackCopyWithImpl<$Res>
    implements $SnackCopyWith<$Res> {
  _$SnackCopyWithImpl(this._self, this._then);

  final Snack _self;
  final $Res Function(Snack) _then;

/// Create a copy of Snack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? price = null,Object? image = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

}


/// Adds pattern-matching-related methods to [Snack].
extension SnackPatterns on Snack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Snack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Snack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Snack value)  $default,){
final _that = this;
switch (_that) {
case _Snack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Snack value)?  $default,){
final _that = this;
switch (_that) {
case _Snack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  double price,  File? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Snack() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  double price,  File? image)  $default,) {final _that = this;
switch (_that) {
case _Snack():
return $default(_that.id,_that.name,_that.price,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  double price,  File? image)?  $default,) {final _that = this;
switch (_that) {
case _Snack() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.image);case _:
  return null;

}
}

}

/// @nodoc


class _Snack with DiagnosticableTreeMixin implements Snack {
  const _Snack({this.id, required this.name, required this.price, this.image});
  

@override final  int? id;
@override final  String name;
@override final  double price;
@override final  File? image;

/// Create a copy of Snack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnackCopyWith<_Snack> get copyWith => __$SnackCopyWithImpl<_Snack>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Snack'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('image', image));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Snack&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,price,image);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Snack(id: $id, name: $name, price: $price, image: $image)';
}


}

/// @nodoc
abstract mixin class _$SnackCopyWith<$Res> implements $SnackCopyWith<$Res> {
  factory _$SnackCopyWith(_Snack value, $Res Function(_Snack) _then) = __$SnackCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, double price, File? image
});




}
/// @nodoc
class __$SnackCopyWithImpl<$Res>
    implements _$SnackCopyWith<$Res> {
  __$SnackCopyWithImpl(this._self, this._then);

  final _Snack _self;
  final $Res Function(_Snack) _then;

/// Create a copy of Snack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? price = null,Object? image = freezed,}) {
  return _then(_Snack(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

// dart format on
