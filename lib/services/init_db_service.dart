import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:snackautomat/application/snack_provider.dart';
import 'package:snackautomat/models/snack.dart';
import 'package:snackautomat/models/transfer.dart';

Future<void> resetAppdataToDefault() async {
  final container = ProviderContainer.test();
  // keeps the provider mounted for the duration of the test
  container.listen(snackListProvider, (_, _) {}, fireImmediately: true);

  await _resetSnacks(container);
  await _resetMoney();
}

Future<void> _resetSnacks(ProviderContainer container) async {
  await container.read(snackListProvider.notifier).addSnacks([
    pringles,
    haribo,
    ritterSport,
  ]);
}

Future<void> _resetMoney() async {}

// default snacks

File _getImg(String name) {
  return File(
    p.normalize(
      p.absolute(p.join("test", "test_assets", "$name.png")),
    ),
  );
}

Snack pringles = Snack(
  name: "pringles",
  price: 1.5,
  image: _getImg("pringles"),
);
Snack haribo = Snack(name: "haribo", price: 1.5, image: _getImg("haribo"));
Snack ritterSport = Snack(
  name: "ritterSport",
  price: 1.5,
  image: _getImg("ritterSport"),
);

// default money

Transfer baseStock = Transfer(
  description: "set base money stock",
  isIncome: true,
  ct5Amount: 10,
  ct10Amount: 10,
  ct20Amount: 5,
  ct50Amount: 4,
  eur1Amount: 5,
  eur2Amount: 2,
  sumInCt: 1350,
);
