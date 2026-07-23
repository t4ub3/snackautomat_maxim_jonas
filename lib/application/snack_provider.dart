import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snackautomat/data/snack_repository.dart';
import 'package:snackautomat/models/snack.dart';

part "snack_provider.g.dart";

@riverpod
class SnackList extends _$SnackList {
  @override
  Future<List<Snack>> build() {
    return ref.watch(snackRepositoryProvider).fetchSnacks();
  }

  Future<void> addSnack(Snack snack) async {
    final created = await ref.read(snackRepositoryProvider).createSnack(snack);
    final current = await future;
    state = AsyncData([...current, created]);
  }
}
