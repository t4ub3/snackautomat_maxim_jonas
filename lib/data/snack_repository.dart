import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snackautomat/data/database_service.dart';
import 'package:snackautomat/models/snack.dart';

part "snack_repository.g.dart";

@riverpod
SnackRepository snackRepository(Ref ref) {
  return snackRepository(ref);
}

class SnackRepository {
  SnackRepository(this._databaseService);
  final DatabaseService _databaseService;

  Future<List<Snack>?> fetchSnacks() => _databaseService.getAll();
  Future<void> createSnack(Snack snack) => _databaseService.addSnack(snack);
}
