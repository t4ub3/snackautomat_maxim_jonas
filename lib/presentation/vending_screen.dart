import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat/application/money_provider.dart';
import 'package:snackautomat/application/snack_provider.dart';
import 'package:snackautomat/application/vending_provider.dart';
import 'package:snackautomat/presentation/admin_page.dart';
import 'package:snackautomat/presentation/helpers.dart';

class Snackautomat extends ConsumerWidget {
  const Snackautomat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snacks = ref.watch(snackListProvider);
    final selectedSnack = ref.watch(selectedSnackProvider);
    final insertedMoney = ref.watch(insertedMoneyProvider);
    final vending = ref.watch(vendingProvider);
    final coinStock = ref.watch(coinStockProvider);
    final exchange = ref.watch(
      calcExchangeProvider(coinStock, insertedMoney),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5E6F8),
      body: Row(
        children: [
          // linke Seite
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.black, width: 2),
                  top: BorderSide(color: Colors.black, width: 2),
                  bottom: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    snacks.when(
                      data: (snacks) {
                        return Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            children: snacks!
                                .map(
                                  (snack) => ProduktFach(
                                    snack: snack,
                                    onTap: () {
                                      ref
                                          .read(selectedSnackProvider.notifier)
                                          .select(snack);

                                      ref
                                          .read(vendingProvider.notifier)
                                          .reset();

                                      ref
                                          .read(insertedMoneyProvider.notifier)
                                          .reset();
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      },
                      error: (error, stackTrace) {
                        return Text("${error.toString()}\n$stackTrace");
                      },
                      loading: () {
                        return Text("loading");
                      },
                    ),

                    // 3x3 Gitter für Produkte
                    const SizedBox(height: 20),
                    // Warenausgabe
                    Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: const Center(
                        child: Text(
                          'Warenausgabe',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // rechte Seite
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: [
                  // Admin
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminPage(),
                          ),
                        );
                      },
                      child: Text('Admin'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Display
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF7ED),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        vending
                            ? 'Bitte Snack entnehmen!'
                            : selectedSnack != null
                            ? insertedMoney.getValueInCents() >=
                                      (selectedSnack.price * 100).toInt()
                                  ? exchange.getValueInCents() ==
                                            insertedMoney.getValueInCents() -
                                                (selectedSnack.price * 100)
                                                    .toInt()
                                        ? 'Preis: ${selectedSnack.price}€'
                                        : 'Kein Wechselgeld verfügbar!'
                                  : insertedMoney.getValueInCents() > 0
                                  ? 'Preis: ${selectedSnack.price}€\n'
                                        'Noch zu zahlen: '
                                        '${((selectedSnack.price * 100 - insertedMoney.getValueInCents()) / 100).toStringAsFixed(2)}€'
                                  : 'Preis: ${selectedSnack.price}€'
                            : 'Bitte wählen Sie ein Produkt ...',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Ziffernblock
                  SizedBox(
                    width: 180,
                    child: Column(
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          children: [
                            for (int i = 1; i <= 9; i++)
                              Button(
                                text: '$i',
                                onPressed: () {
                                  if (i <= snacks.value!.length) {
                                    final snack = snacks.value![i - 1];
                                    ref
                                        .read(selectedSnackProvider.notifier)
                                        .select(snacks.value![i - 1]);
                                    ref
                                        .read(insertedMoneyProvider.notifier)
                                        .reset();

                                    ref.read(vendingProvider.notifier).reset();
                                  }
                                },
                              ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Button(
                          text: 'bestätigen',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Münzeingabe
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.attach_money,
                          color: Colors.orange,
                          size: 40,
                        ),
                        const SizedBox(width: 0),
                        Container(
                          width: 15,
                          height: 80,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 15),
                        // Münzen
                        SizedBox(
                          width: 120,
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            children:
                                [
                                  '5ct',
                                  '50ct',
                                  '10ct',
                                  '1€',
                                  '20ct',
                                  '2€',
                                ].map((wert) {
                                  int value = wert == '5ct'
                                      ? 5
                                      : wert == '10ct'
                                      ? 10
                                      : wert == '20ct'
                                      ? 20
                                      : wert == '50ct'
                                      ? 50
                                      : wert == '1€'
                                      ? 100
                                      : wert == '2€'
                                      ? 200
                                      : 0;

                                  return Button(
                                    text: wert,
                                    onPressed: () {
                                      ref
                                          .read(insertedMoneyProvider.notifier)
                                          .addCoin(value);
                                    },
                                  );
                                }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),
                  // Wechselgeld
                  Column(
                    children: [
                      const Text(
                        'Wechselgeld',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            '${(ref.read(vendingProvider.notifier).exchange.getValueInCents() / 100).toStringAsFixed(2)} €',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
