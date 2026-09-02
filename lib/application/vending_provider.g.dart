// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vending_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Vending)
final vendingProvider = VendingProvider._();

final class VendingProvider extends $NotifierProvider<Vending, VendingState> {
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
  Override overrideWithValue(VendingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VendingState>(value),
    );
  }
}

String _$vendingHash() => r'f784dee0226883d46610a58067aad1e0693c8484';

abstract class _$Vending extends $Notifier<VendingState> {
  VendingState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<VendingState, VendingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VendingState, VendingState>,
              VendingState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
