import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snackautomat/application/snack_provider.dart';
import 'package:snackautomat/application/vending_provider.dart';
import '../models/sum_of_money.dart';

part 'money_provider.g.dart';

@riverpod
class InsertedMoney extends _$InsertedMoney {
  @override
  SumOfMoney build() => SumOfMoney(
    count200ct: 0,
    count100ct: 0,
    count50ct: 0,
    count20ct: 0,
    count10ct: 0,
    count5ct: 0,
  );

  void addCoin(int value) {
    if (value == 200) {
      state = state.copyWith(count200ct: state.count200ct + 1);
    } else if (value == 100) {
      state = state.copyWith(count100ct: state.count100ct + 1);
    } else if (value == 50) {
      state = state.copyWith(count50ct: state.count50ct + 1);
    } else if (value == 20) {
      state = state.copyWith(count20ct: state.count20ct + 1);
    } else if (value == 10) {
      state = state.copyWith(count10ct: state.count10ct + 1);
    } else if (value == 5) {
      state = state.copyWith(count5ct: state.count5ct + 1);
    }

    final selectedSnack = ref.read(selectedSnackProvider);

    if (selectedSnack == null) {
      return;
    }

    final priceInCents = (selectedSnack.price * 100).toInt();
    final insertedInCents = state.getValueInCents();

    if (insertedInCents >= priceInCents) {
      ref.read(vendingProvider.notifier).buySnack();
    }
  }

  void reset() {
    state = SumOfMoney(
      count200ct: 0,
      count100ct: 0,
      count50ct: 0,
      count20ct: 0,
      count10ct: 0,
      count5ct: 0,
    );
  }
}

@riverpod
class CoinStock extends _$CoinStock {
  @override
  SumOfMoney build() {
    return SumOfMoney(
      count200ct: 5,
      count100ct: 5,
      count50ct: 10,
      count20ct: 10,
      count10ct: 10,
      count5ct: 10,
    );
  }
}

@riverpod
SumOfMoney calcExchange(Ref ref, SumOfMoney stock, SumOfMoney input) {
  final selectedSnack = ref.watch(selectedSnackProvider);

  if (selectedSnack == null) {
    return SumOfMoney(
      count200ct: 0,
      count100ct: 0,
      count50ct: 0,
      count20ct: 0,
      count10ct: 0,
      count5ct: 0,
    );
  }

  double snackPrice = selectedSnack.price;

  // Summe der eingezahlten Münzen in Cent berechnen
  int inputSum =
      (input.count200ct * 200) +
      (input.count100ct * 100) +
      (input.count50ct * 50) +
      (input.count20ct * 20) +
      (input.count10ct * 10) +
      (input.count5ct * 5);

  // Wechselgeld berechnen
  int exchangeAmount = inputSum - (snackPrice * 100).toInt();

  if (exchangeAmount < 0) {
    // Nicht genug Geld eingezahlt
    return SumOfMoney(
      count200ct: 0,
      count100ct: 0,
      count50ct: 0,
      count20ct: 0,
      count10ct: 0,
      count5ct: 0,
    );
  }

  final coinData = [
    (200, stock.count200ct),
    (100, stock.count100ct),
    (50, stock.count50ct),
    (20, stock.count20ct),
    (10, stock.count10ct),
    (5, stock.count5ct),
  ];

  int remaining = exchangeAmount;
  final counts = [0, 0, 0, 0, 0, 0];

  for (int i = 0; i < coinData.length; i++) {
    final (value, available) = coinData[i];
    counts[i] = (remaining ~/ value).clamp(0, available);
    remaining -= counts[i] * value;
  }

  if (remaining > 0) {
    return SumOfMoney(
      count200ct: 0,
      count100ct: 0,
      count50ct: 0,
      count20ct: 0,
      count10ct: 0,
      count5ct: 0,
    );
  }

  return SumOfMoney(
    count200ct: counts[0],
    count100ct: counts[1],
    count50ct: counts[2],
    count20ct: counts[3],
    count10ct: counts[4],
    count5ct: counts[5],
  );
}
