// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SnackList)
final snackListProvider = SnackListProvider._();

final class SnackListProvider
    extends $AsyncNotifierProvider<SnackList, List<Snack>> {
  SnackListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'snackListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$snackListHash();

  @$internal
  @override
  SnackList create() => SnackList();
}

String _$snackListHash() => r'46c5333e6f19c4a8fc9e117138c630d6cbf4bde4';

abstract class _$SnackList extends $AsyncNotifier<List<Snack>> {
  FutureOr<List<Snack>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Snack>>, List<Snack>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Snack>>, List<Snack>>,
              AsyncValue<List<Snack>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedSnack)
final selectedSnackProvider = SelectedSnackProvider._();

final class SelectedSnackProvider
    extends $NotifierProvider<SelectedSnack, Snack?> {
  SelectedSnackProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedSnackProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedSnackHash();

  @$internal
  @override
  SelectedSnack create() => SelectedSnack();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Snack? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Snack?>(value),
    );
  }
}

String _$selectedSnackHash() => r'ac21f57f79a936dbac74d1a8d9ab30d0b297ebcb';

abstract class _$SelectedSnack extends $Notifier<Snack?> {
  Snack? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Snack?, Snack?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Snack?, Snack?>,
              Snack?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
