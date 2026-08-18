import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:snackautomat/application/money_provider.dart';
import 'package:snackautomat/application/snack_provider.dart';

part 'vending_provider.g.dart';

@riverpod
class Vending extends _$Vending {
  @override
  bool build() {
    return false;
  }

  void buySnack() {
    final selectedSnack = ref.read(selectedSnackProvider);
    final insertedMoney = ref.read(insertedMoneyProvider);
    final coinStock = ref.read(coinStockProvider);

    if (selectedSnack == null) {
      return;
    }

    final priceInCents = (selectedSnack.price * 100).toInt();
    final insertedInCents = insertedMoney.getValueInCents();

    if (insertedInCents < priceInCents) {
      return;
    }

    // Wechselgeld berechnen
    final exchange = ref.read(
      calcExchangeProvider(coinStock, insertedMoney),
    );

    // Kauf erfolgreich
    state = true;

    // Eingezahltes Geld zurücksetzen
    ref.read(insertedMoneyProvider.notifier).reset();
  }

  void reset() {
    state = false;
  }
}
