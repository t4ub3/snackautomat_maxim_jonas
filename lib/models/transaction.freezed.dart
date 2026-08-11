// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Transaction implements DiagnosticableTreeMixin {

 int? get id; String get description; bool get isIncome; int get ct5Amount; int get ct10Amount; int get ct20Amount; int get ct50Amount; int get eur1Amount; int get eur2Amount; int get sumInCt;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Transaction'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('isIncome', isIncome))..add(DiagnosticsProperty('ct5Amount', ct5Amount))..add(DiagnosticsProperty('ct10Amount', ct10Amount))..add(DiagnosticsProperty('ct20Amount', ct20Amount))..add(DiagnosticsProperty('ct50Amount', ct50Amount))..add(DiagnosticsProperty('eur1Amount', eur1Amount))..add(DiagnosticsProperty('eur2Amount', eur2Amount))..add(DiagnosticsProperty('sumInCt', sumInCt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome)&&(identical(other.ct5Amount, ct5Amount) || other.ct5Amount == ct5Amount)&&(identical(other.ct10Amount, ct10Amount) || other.ct10Amount == ct10Amount)&&(identical(other.ct20Amount, ct20Amount) || other.ct20Amount == ct20Amount)&&(identical(other.ct50Amount, ct50Amount) || other.ct50Amount == ct50Amount)&&(identical(other.eur1Amount, eur1Amount) || other.eur1Amount == eur1Amount)&&(identical(other.eur2Amount, eur2Amount) || other.eur2Amount == eur2Amount)&&(identical(other.sumInCt, sumInCt) || other.sumInCt == sumInCt));
}


@override
int get hashCode => Object.hash(runtimeType,id,description,isIncome,ct5Amount,ct10Amount,ct20Amount,ct50Amount,eur1Amount,eur2Amount,sumInCt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Transaction(id: $id, description: $description, isIncome: $isIncome, ct5Amount: $ct5Amount, ct10Amount: $ct10Amount, ct20Amount: $ct20Amount, ct50Amount: $ct50Amount, eur1Amount: $eur1Amount, eur2Amount: $eur2Amount, sumInCt: $sumInCt)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
 int? id, String description, bool isIncome, int ct5Amount, int ct10Amount, int ct20Amount, int ct50Amount, int eur1Amount, int eur2Amount, int sumInCt
});




}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? description = null,Object? isIncome = null,Object? ct5Amount = null,Object? ct10Amount = null,Object? ct20Amount = null,Object? ct50Amount = null,Object? eur1Amount = null,Object? eur2Amount = null,Object? sumInCt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isIncome: null == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool,ct5Amount: null == ct5Amount ? _self.ct5Amount : ct5Amount // ignore: cast_nullable_to_non_nullable
as int,ct10Amount: null == ct10Amount ? _self.ct10Amount : ct10Amount // ignore: cast_nullable_to_non_nullable
as int,ct20Amount: null == ct20Amount ? _self.ct20Amount : ct20Amount // ignore: cast_nullable_to_non_nullable
as int,ct50Amount: null == ct50Amount ? _self.ct50Amount : ct50Amount // ignore: cast_nullable_to_non_nullable
as int,eur1Amount: null == eur1Amount ? _self.eur1Amount : eur1Amount // ignore: cast_nullable_to_non_nullable
as int,eur2Amount: null == eur2Amount ? _self.eur2Amount : eur2Amount // ignore: cast_nullable_to_non_nullable
as int,sumInCt: null == sumInCt ? _self.sumInCt : sumInCt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transaction value)  $default,){
final _that = this;
switch (_that) {
case _Transaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transaction value)?  $default,){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String description,  bool isIncome,  int ct5Amount,  int ct10Amount,  int ct20Amount,  int ct50Amount,  int eur1Amount,  int eur2Amount,  int sumInCt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.description,_that.isIncome,_that.ct5Amount,_that.ct10Amount,_that.ct20Amount,_that.ct50Amount,_that.eur1Amount,_that.eur2Amount,_that.sumInCt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String description,  bool isIncome,  int ct5Amount,  int ct10Amount,  int ct20Amount,  int ct50Amount,  int eur1Amount,  int eur2Amount,  int sumInCt)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
return $default(_that.id,_that.description,_that.isIncome,_that.ct5Amount,_that.ct10Amount,_that.ct20Amount,_that.ct50Amount,_that.eur1Amount,_that.eur2Amount,_that.sumInCt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String description,  bool isIncome,  int ct5Amount,  int ct10Amount,  int ct20Amount,  int ct50Amount,  int eur1Amount,  int eur2Amount,  int sumInCt)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.description,_that.isIncome,_that.ct5Amount,_that.ct10Amount,_that.ct20Amount,_that.ct50Amount,_that.eur1Amount,_that.eur2Amount,_that.sumInCt);case _:
  return null;

}
}

}

/// @nodoc


class _Transaction with DiagnosticableTreeMixin implements Transaction {
  const _Transaction({this.id, required this.description, required this.isIncome, required this.ct5Amount, required this.ct10Amount, required this.ct20Amount, required this.ct50Amount, required this.eur1Amount, required this.eur2Amount, required this.sumInCt});
  

@override final  int? id;
@override final  String description;
@override final  bool isIncome;
@override final  int ct5Amount;
@override final  int ct10Amount;
@override final  int ct20Amount;
@override final  int ct50Amount;
@override final  int eur1Amount;
@override final  int eur2Amount;
@override final  int sumInCt;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Transaction'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('isIncome', isIncome))..add(DiagnosticsProperty('ct5Amount', ct5Amount))..add(DiagnosticsProperty('ct10Amount', ct10Amount))..add(DiagnosticsProperty('ct20Amount', ct20Amount))..add(DiagnosticsProperty('ct50Amount', ct50Amount))..add(DiagnosticsProperty('eur1Amount', eur1Amount))..add(DiagnosticsProperty('eur2Amount', eur2Amount))..add(DiagnosticsProperty('sumInCt', sumInCt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome)&&(identical(other.ct5Amount, ct5Amount) || other.ct5Amount == ct5Amount)&&(identical(other.ct10Amount, ct10Amount) || other.ct10Amount == ct10Amount)&&(identical(other.ct20Amount, ct20Amount) || other.ct20Amount == ct20Amount)&&(identical(other.ct50Amount, ct50Amount) || other.ct50Amount == ct50Amount)&&(identical(other.eur1Amount, eur1Amount) || other.eur1Amount == eur1Amount)&&(identical(other.eur2Amount, eur2Amount) || other.eur2Amount == eur2Amount)&&(identical(other.sumInCt, sumInCt) || other.sumInCt == sumInCt));
}


@override
int get hashCode => Object.hash(runtimeType,id,description,isIncome,ct5Amount,ct10Amount,ct20Amount,ct50Amount,eur1Amount,eur2Amount,sumInCt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Transaction(id: $id, description: $description, isIncome: $isIncome, ct5Amount: $ct5Amount, ct10Amount: $ct10Amount, ct20Amount: $ct20Amount, ct50Amount: $ct50Amount, eur1Amount: $eur1Amount, eur2Amount: $eur2Amount, sumInCt: $sumInCt)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
 int? id, String description, bool isIncome, int ct5Amount, int ct10Amount, int ct20Amount, int ct50Amount, int eur1Amount, int eur2Amount, int sumInCt
});




}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? description = null,Object? isIncome = null,Object? ct5Amount = null,Object? ct10Amount = null,Object? ct20Amount = null,Object? ct50Amount = null,Object? eur1Amount = null,Object? eur2Amount = null,Object? sumInCt = null,}) {
  return _then(_Transaction(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isIncome: null == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool,ct5Amount: null == ct5Amount ? _self.ct5Amount : ct5Amount // ignore: cast_nullable_to_non_nullable
as int,ct10Amount: null == ct10Amount ? _self.ct10Amount : ct10Amount // ignore: cast_nullable_to_non_nullable
as int,ct20Amount: null == ct20Amount ? _self.ct20Amount : ct20Amount // ignore: cast_nullable_to_non_nullable
as int,ct50Amount: null == ct50Amount ? _self.ct50Amount : ct50Amount // ignore: cast_nullable_to_non_nullable
as int,eur1Amount: null == eur1Amount ? _self.eur1Amount : eur1Amount // ignore: cast_nullable_to_non_nullable
as int,eur2Amount: null == eur2Amount ? _self.eur2Amount : eur2Amount // ignore: cast_nullable_to_non_nullable
as int,sumInCt: null == sumInCt ? _self.sumInCt : sumInCt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
