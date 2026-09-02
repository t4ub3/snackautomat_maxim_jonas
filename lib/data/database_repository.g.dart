// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(databaseRepository)
final databaseRepositoryProvider = DatabaseRepositoryProvider._();

final class DatabaseRepositoryProvider
    extends
        $FunctionalProvider<
          DatabaseRepository,
          DatabaseRepository,
          DatabaseRepository
        >
    with $Provider<DatabaseRepository> {
  DatabaseRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseRepositoryHash();

  @$internal
  @override
  $ProviderElement<DatabaseRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DatabaseRepository create(Ref ref) {
    return databaseRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DatabaseRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DatabaseRepository>(value),
    );
  }
}

String _$databaseRepositoryHash() =>
    r'c9249d3a927bec5945b230fb9c394053ff6fdff2';
