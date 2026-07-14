// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(snackRepository)
final snackRepositoryProvider = SnackRepositoryProvider._();

final class SnackRepositoryProvider
    extends
        $FunctionalProvider<SnackRepository, SnackRepository, SnackRepository>
    with $Provider<SnackRepository> {
  SnackRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'snackRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$snackRepositoryHash();

  @$internal
  @override
  $ProviderElement<SnackRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SnackRepository create(Ref ref) {
    return snackRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SnackRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SnackRepository>(value),
    );
  }
}

String _$snackRepositoryHash() => r'68a16a31d30e3cc27c3e72900858a7245110a7f9';
