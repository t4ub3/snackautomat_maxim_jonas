import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:snackautomat/models/snack.dart';

class SnackDbModel {
  final int? id;
  final String name;
  final double price;
  final String imageAsBase64;
  final int amount;

  SnackDbModel(
    this.id,
    this.name,
    this.price,
    this.imageAsBase64,
    this.amount,
  );
}

Future<SnackDbModel> dbModelfromSnack(Snack snack) async {
  final base64String = base64Encode(await snack.image.readAsBytes());
  return SnackDbModel(
    snack.id,
    snack.name,
    snack.price,
    base64String,
    snack.amount,
  );
}

Future<Snack> snackFromDbModel(SnackDbModel snackDb) async {
  File image;
  final bytes = base64Decode(snackDb.imageAsBase64);
  final dir = await Directory.systemTemp.createTemp('snack_temp');
  image = File(join(dir.path, "${snackDb.name}.png"));
  await image.writeAsBytes(bytes);

  return Snack(
    id: snackDb.id,
    name: snackDb.name,
    price: snackDb.price,
    image: image,
    amount: snackDb.amount,
  );
}
