// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InsertedMoney)
final insertedMoneyProvider = InsertedMoneyProvider._();

final class InsertedMoneyProvider
    extends $NotifierProvider<InsertedMoney, SumOfMoney> {
  InsertedMoneyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'insertedMoneyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$insertedMoneyHash();

  @$internal
  @override
  InsertedMoney create() => InsertedMoney();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SumOfMoney value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SumOfMoney>(value),
    );
  }
}

String _$insertedMoneyHash() => r'9da8023f0f2d02deea3ca09af6ae4430a2022213';

abstract class _$InsertedMoney extends $Notifier<SumOfMoney> {
  SumOfMoney build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SumOfMoney, SumOfMoney>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SumOfMoney, SumOfMoney>,
              SumOfMoney,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(CoinStock)
final coinStockProvider = CoinStockProvider._();

final class CoinStockProvider extends $NotifierProvider<CoinStock, SumOfMoney> {
  CoinStockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coinStockProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coinStockHash();

  @$internal
  @override
  CoinStock create() => CoinStock();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SumOfMoney value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SumOfMoney>(value),
    );
  }
}

String _$coinStockHash() => r'703b2998bc63b57143e2cf78abfd0c4e6ab34719';

abstract class _$CoinStock extends $Notifier<SumOfMoney> {
  SumOfMoney build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SumOfMoney, SumOfMoney>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SumOfMoney, SumOfMoney>,
              SumOfMoney,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(calcExchange)
final calcExchangeProvider = CalcExchangeFamily._();

final class CalcExchangeProvider
    extends $FunctionalProvider<SumOfMoney, SumOfMoney, SumOfMoney>
    with $Provider<SumOfMoney> {
  CalcExchangeProvider._({
    required CalcExchangeFamily super.from,
    required (SumOfMoney, SumOfMoney) super.argument,
  }) : super(
         retry: null,
         name: r'calcExchangeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$calcExchangeHash();

  @override
  String toString() {
    return r'calcExchangeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<SumOfMoney> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SumOfMoney create(Ref ref) {
    final argument = this.argument as (SumOfMoney, SumOfMoney);
    return calcExchange(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SumOfMoney value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SumOfMoney>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CalcExchangeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$calcExchangeHash() => r'b9263899385b4decd67af12b2a80c7280f7af1b3';

final class CalcExchangeFamily extends $Family
    with $FunctionalFamilyOverride<SumOfMoney, (SumOfMoney, SumOfMoney)> {
  CalcExchangeFamily._()
    : super(
        retry: null,
        name: r'calcExchangeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CalcExchangeProvider call(SumOfMoney stock, SumOfMoney input) =>
      CalcExchangeProvider._(argument: (stock, input), from: this);

  @override
  String toString() => r'calcExchangeProvider';
}
