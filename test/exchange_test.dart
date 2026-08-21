import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:snackautomat/application/money_provider.dart';
import 'package:snackautomat/application/snack_provider.dart';
import 'package:snackautomat/models/snack.dart';

void main() {
  test('exchangeTest', () {
    final container = ProviderContainer.test();

    final image = File(
      p.normalize(
        p.absolute(
          p.join('test', 'test_assets', 'pringles.png'),
        ),
      ),
    );

    final snack = Snack(
      name: 'Pringles',
      price: 1.80,
      image: image,
    );

    container.read(selectedSnackProvider.notifier).select(snack);

    final input = container.read(insertedMoneyProvider).copyWith(count200ct: 1);

    final stocks = [
      // 1 x 20ct vorhanden
      container
          .read(coinStockProvider)
          .copyWith(
            count20ct: 1,
          ),

      // 2 x 10ct vorhanden
      container
          .read(coinStockProvider)
          .copyWith(
            count20ct: 0,
            count10ct: 2,
          ),

      // Kein passendes Wechselgeld vorhanden
      container
          .read(coinStockProvider)
          .copyWith(
            count20ct: 0,
            count10ct: 0,
            count5ct: 0,
          ),
    ];

    final expected = [
      20,
      20,
      0,
    ];

    for (int i = 0; i < stocks.length; i++) {
      final exchange = container.read(
        calcExchangeProvider(stocks[i], input),
      );

      expect(
        exchange.getValueInCents(),
        expected[i],
      );
    }
  });
}
