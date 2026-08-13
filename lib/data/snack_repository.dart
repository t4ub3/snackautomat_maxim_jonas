import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snackautomat/models/transfer.dart';
import 'package:snackautomat/services/database_service.dart';
import 'package:snackautomat/data/snack_db_model.dart';
import 'package:snackautomat/models/snack.dart';

part "snack_repository.g.dart";

@riverpod
DatabaseRepository snackRepository(Ref ref) {
  return DatabaseRepository(DatabaseService.db);
}

class DatabaseRepository {
  DatabaseRepository(this._databaseService);
  final DatabaseService _databaseService;

  Future<List<Snack>> fetchSnacks() async {
    final dbModels = await _databaseService.getAllSnacks();
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
    return await snackFromDbModel(await _databaseService.getSnackById(id));
  }

  Future<Transfer> createTransfer(Transfer transfer) async {
    final id = await _databaseService.addTransfer(transfer);
    return await _databaseService.getTransferById(id);
  }
}
