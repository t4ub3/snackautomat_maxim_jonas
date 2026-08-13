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
        $FunctionalProvider<
          DatabaseRepository,
          DatabaseRepository,
          DatabaseRepository
        >
    with $Provider<DatabaseRepository> {
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
  $ProviderElement<DatabaseRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DatabaseRepository create(Ref ref) {
    return snackRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DatabaseRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DatabaseRepository>(value),
    );
  }
}

String _$snackRepositoryHash() => r'f61974562d1c2fab26e734d84200896a5bdd87a9';
