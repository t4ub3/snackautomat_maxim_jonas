import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:snackautomat/application/money_provider.dart';
import 'package:snackautomat/application/snack_provider.dart';
import 'package:snackautomat/models/sum_of_money.dart';

part 'vending_provider.g.dart';

@riverpod
class Vending extends _$Vending {
  @override
  bool build() {
    return false;
  }

  SumOfMoney exchange = SumOfMoney(
    count200ct: 0,
    count100ct: 0,
    count50ct: 0,
    count20ct: 0,
    count10ct: 0,
    count5ct: 0,
  );

  void buySnack() {
    final selectedSnack = ref.read(selectedSnackProvider);
    final insertedMoney = ref.read(insertedMoneyProvider);
    final coinStock = ref.read(coinStockProvider);

    if (selectedSnack == null) {
      return;
    }

    final priceInCents = (selectedSnack.price * 100).toInt();
    final insertedInCents = insertedMoney.getValueInCents();

    // Nicht genug Geld
    if (insertedInCents < priceInCents) {
      return;
    }

    // Benötigtes Wechselgeld
    final requiredExchange = insertedInCents - priceInCents;

    // Wechselgeld berechnen
    exchange = ref.read(
      calcExchangeProvider(coinStock, insertedMoney),
    );

    // Prüfen, ob das benötigte Wechselgeld gebildet werden kann
    if (exchange.getValueInCents() != requiredExchange) {
      return;
    }

    // Kauf erfolgreich
    state = true;

    // Eingezahltes Geld zurücksetzen
    ref.read(insertedMoneyProvider.notifier).reset();
  }

  void reset() {
    state = false;

    exchange = SumOfMoney(
      count200ct: 0,
      count100ct: 0,
      count50ct: 0,
      count20ct: 0,
      count10ct: 0,
      count5ct: 0,
    );
  }
}
