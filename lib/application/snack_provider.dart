import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snackautomat/data/database_repository.dart';
import 'package:snackautomat/models/snack.dart';

part "snack_provider.g.dart";

@riverpod
class SnackList extends _$SnackList {
  @override
  Future<List<Snack>> build() {
    return ref.watch(databaseRepositoryProvider).fetchSnacks();
  }

  Future<void> addSnack(Snack snack) async {
    final created = await ref
        .read(databaseRepositoryProvider)
        .createSnack(snack);
    final current = await future;
    state = AsyncData([...current, created]);
  }

  Future<void> addSnacks(List<Snack> snacks) async {
    final List<Snack> createdSnacks = [];
    for (var snack in snacks) {
      final created = await ref
          .read(databaseRepositoryProvider)
          .createSnack(snack);
      createdSnacks.add(created);
    }
    final current = await future;
    state = AsyncData([...current, ...createdSnacks]);
  }

  Future<void> decreaseAmount(Snack snack) async {
    if (snack.id == null) {
      return;
    }

    final newAmount = snack.amount - 1;
    await ref
        .read(databaseRepositoryProvider)
        .updateSnackAmount(snack.id!, newAmount);

    final current = await future;
    state = AsyncData([
      for (final s in current)
        if (s.id == snack.id) s.copyWith(amount: newAmount) else s,
    ]);
  }
}

@riverpod
class SelectedSnack extends _$SelectedSnack {
  @override
  Snack? build() {
    return null;
  }

  void select(Snack snack) {
    state = snack;
  }
}
