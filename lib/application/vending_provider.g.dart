// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vending_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Vending)
final vendingProvider = VendingProvider._();

final class VendingProvider extends $NotifierProvider<Vending, bool> {
  VendingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vendingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vendingHash();

  @$internal
  @override
  Vending create() => Vending();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$vendingHash() => r'f260356e9b87ca733c9384af99ee253e216577c2';

abstract class _$Vending extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
