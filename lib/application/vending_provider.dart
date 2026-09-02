import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:snackautomat/application/money_provider.dart';
import 'package:snackautomat/application/snack_provider.dart';
import 'package:snackautomat/data/database_repository.dart';
import 'package:snackautomat/models/sum_of_money.dart';
import 'package:snackautomat/models/transfer.dart';

part 'vending_provider.g.dart';

final _noMoney = SumOfMoney(
  count200ct: 0,
  count100ct: 0,
  count50ct: 0,
  count20ct: 0,
  count10ct: 0,
  count5ct: 0,
);

class VendingState {
  const VendingState({required this.isDispensing, required this.exchange});

  final bool isDispensing;
  final SumOfMoney exchange;
}

@riverpod
class Vending extends _$Vending {
  @override
  VendingState build() {
    return VendingState(isDispensing: false, exchange: _noMoney);
  }

  Future<void> buySnack() async {
    final selectedSnack = ref.read(selectedSnackProvider);
    final insertedMoney = ref.read(insertedMoneyProvider);

    if (selectedSnack == null) {
      return;
    }

    // Kein Vorrat mehr
    if (selectedSnack.amount <= 0) {
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

    // Aktuellen Münzbestand aus der Datenbank laden
    final coinStock = await ref.read(coinStockProvider.future);

    // Wechselgeld berechnen
    final exchange = ref.read(
      calcExchangeProvider(coinStock, insertedMoney),
    );

    // Prüfen, ob das benötigte Wechselgeld gebildet werden kann
    if (exchange.getValueInCents() != requiredExchange) {
      return;
    }

    final databaseRepository = ref.read(databaseRepositoryProvider);

    // Eingezahltes Geld als Transaktion + Kassenbestand verbuchen
    await databaseRepository.createTransfer(
      Transfer(
        description: 'Kauf: ${selectedSnack.name}',
        isIncome: true,
        ct5Amount: insertedMoney.count5ct,
        ct10Amount: insertedMoney.count10ct,
        ct20Amount: insertedMoney.count20ct,
        ct50Amount: insertedMoney.count50ct,
        eur1Amount: insertedMoney.count100ct,
        eur2Amount: insertedMoney.count200ct,
        sumInCt: insertedInCents,
      ),
    );

    // Ausgezahltes Wechselgeld als Transaktion + Kassenbestand verbuchen
    if (exchange.getValueInCents() > 0) {
      await databaseRepository.createTransfer(
        Transfer(
          description: 'Wechselgeld: ${selectedSnack.name}',
          isIncome: false,
          ct5Amount: exchange.count5ct,
          ct10Amount: exchange.count10ct,
          ct20Amount: exchange.count20ct,
          ct50Amount: exchange.count50ct,
          eur1Amount: exchange.count100ct,
          eur2Amount: exchange.count200ct,
          sumInCt: exchange.getValueInCents(),
        ),
      );
    }

    // Snackbestand verringern
    await ref.read(snackListProvider.notifier).decreaseAmount(selectedSnack);

    // Münzbestand neu aus der Datenbank laden
    ref.invalidate(coinStockProvider);

    // Kauf erfolgreich
    state = VendingState(isDispensing: true, exchange: exchange);

    // Eingezahltes Geld zurücksetzen
    ref.read(insertedMoneyProvider.notifier).reset();
  }

  void reset() {
    state = VendingState(isDispensing: false, exchange: _noMoney);
  }
}
