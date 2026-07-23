import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snackautomat/services/database_service.dart';
import 'package:snackautomat/data/snack_db_model.dart';
import 'package:snackautomat/models/snack.dart';

part "snack_repository.g.dart";

@riverpod
SnackRepository snackRepository(Ref ref) {
  return SnackRepository(DatabaseService.db);
}

class SnackRepository {
  SnackRepository(this._databaseService);
  final DatabaseService _databaseService;

  Future<List<Snack>> fetchSnacks() async {
    final dbModels = await _databaseService.getAll();
    if (dbModels != null) {
      final snacks = Future.wait(
        dbModels.map((snackDb) async {
          return snackFromDbModel(snackDb);
        }),
      );
      return snacks;
    }
    return [];
  }

  Future<Snack> createSnack(Snack snack) async {
    final SnackDbModel snackDb = await dbModelfromSnack(snack);
    final id = await _databaseService.addSnack(snackDb);
    return await snackFromDbModel(await _databaseService.getById(id));
  }
}
