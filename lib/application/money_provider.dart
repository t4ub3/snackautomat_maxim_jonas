// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:snackautomat/data/snack_repository.dart';
// import 'package:snackautomat/models/snack.dart';

// part "money_provider.g.dart";

// @riverpod
// class Money extends _$Money {
//   @override
//   Future<List<Snack>> build() {
//     return ref.watch(snackRepositoryProvider).fetchSnacks();
//   }

//   Future<void> addSnack(Snack snack) async {
//     final created = await ref.read(snackRepositoryProvider).createSnack(snack);
//     final current = await future;
//     state = AsyncData([...current, created]);
//   }

//   Future<void> addSnacks(List<Snack> snacks) async {
//     final List<Snack> createdSnacks = [];
//     for (var snack in snacks) {
//       final created = await ref
//           .read(snackRepositoryProvider)
//           .createSnack(snack);
//       createdSnacks.add(created);
//     }
//     final current = await future;
//     state = AsyncData([...current, ...createdSnacks]);
//   }
// }
