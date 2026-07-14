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
    extends $AsyncNotifierProvider<SnackList, List<Snack>?> {
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

String _$snackListHash() => r'07d68a829e35f6cb38f4e572bf404eed245615d4';

abstract class _$SnackList extends $AsyncNotifier<List<Snack>?> {
  FutureOr<List<Snack>?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Snack>?>, List<Snack>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Snack>?>, List<Snack>?>,
              AsyncValue<List<Snack>?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
