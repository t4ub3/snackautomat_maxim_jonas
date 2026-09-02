import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat/application/money_provider.dart';
import 'package:snackautomat/application/snack_provider.dart';
import 'package:snackautomat/models/snack.dart';
import 'package:snackautomat/models/sum_of_money.dart';

class _CoinDenomination {
  final String name;
  final int valueCt;

  const _CoinDenomination(this.name, this.valueCt);
}

const _coinDenominations = [
  _CoinDenomination('5 ct', 5),
  _CoinDenomination('10 ct', 10),
  _CoinDenomination('20 ct', 20),
  _CoinDenomination('50 ct', 50),
  _CoinDenomination('1 €', 100),
  _CoinDenomination('2 €', 200),
];

int _stockForValue(SumOfMoney stock, int valueCt) {
  switch (valueCt) {
    case 5:
      return stock.count5ct;
    case 10:
      return stock.count10ct;
    case 20:
      return stock.count20ct;
    case 50:
      return stock.count50ct;
    case 100:
      return stock.count100ct;
    case 200:
      return stock.count200ct;
    default:
      return 0;
  }
}

class AdminPage extends ConsumerStatefulWidget {
  const AdminPage({super.key});

  @override
  ConsumerState<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends ConsumerState<AdminPage> {
  final Map<int, int> _snackAdditions = {};
  final Map<int, int> _coinAdditions = {
    for (final coin in _coinDenominations) coin.valueCt: 0,
  };

  void _changeSnackAddition(int snackId, int delta) {
    setState(() {
      final current = _snackAdditions[snackId] ?? 0;
      _snackAdditions[snackId] = (current + delta).clamp(0, 999);
    });
  }

  void _changeCoinAddition(int valueCt, int delta) {
    setState(() {
      final current = _coinAdditions[valueCt] ?? 0;
      _coinAdditions[valueCt] = (current + delta).clamp(0, 999);
    });
  }

  Future<void> _addSnacks(List<Snack> snacks) async {
    for (final snack in snacks) {
      final delta = snack.id == null ? 0 : (_snackAdditions[snack.id] ?? 0);
      if (delta > 0) {
        await ref.read(snackListProvider.notifier).increaseAmount(snack, delta);
      }
    }
    setState(_snackAdditions.clear);
  }

  Future<void> _depositCoins() async {
    final addition = SumOfMoney(
      count200ct: _coinAdditions[200] ?? 0,
      count100ct: _coinAdditions[100] ?? 0,
      count50ct: _coinAdditions[50] ?? 0,
      count20ct: _coinAdditions[20] ?? 0,
      count10ct: _coinAdditions[10] ?? 0,
      count5ct: _coinAdditions[5] ?? 0,
    );
    await ref.read(coinStockProvider.notifier).addCoins(addition);
    setState(() {
      for (final key in _coinAdditions.keys) {
        _coinAdditions[key] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final snacksAsync = ref.watch(snackListProvider);
    final coinStockAsync = ref.watch(coinStockProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5E6F8),
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Linke Seite
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Produkte',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  snacksAsync.when(
                    data: (snacks) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Table(
                            border: TableBorder.all(color: Colors.black),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              const TableRow(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Snack',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Preis',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Vorrat',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Hinzufügen',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...snacks.map(
                                (snack) => TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        snack.name,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        '${snack.price.toStringAsFixed(2)} €',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        snack.amount.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            (snack.id == null
                                                    ? 0
                                                    : _snackAdditions[snack
                                                              .id] ??
                                                          0)
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: snack.id == null
                                                    ? null
                                                    : () =>
                                                          _changeSnackAddition(
                                                            snack.id!,
                                                            1,
                                                          ),
                                                child: const Icon(
                                                  Icons.arrow_drop_up,
                                                  color: Colors.green,
                                                  size: 28,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: snack.id == null
                                                    ? null
                                                    : () =>
                                                          _changeSnackAddition(
                                                            snack.id!,
                                                            -1,
                                                          ),
                                                child: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.red,
                                                  size: 28,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () => _addSnacks(snacks),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              child: const Text(
                                'Hinzufügen',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return Text('$error');
                    },
                    loading: () {
                      return const Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Rechte Seite
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Bargeld',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  coinStockAsync.when(
                    data: (coinStock) {
                      return Table(
                        border: TableBorder.all(color: Colors.black),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          const TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'Münze',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'Bestand',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'Hinzufügen',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ..._coinDenominations.map(
                            (coin) => TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    coin.name,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    _stockForValue(
                                      coinStock,
                                      coin.valueCt,
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        (_coinAdditions[coin.valueCt] ?? 0)
                                            .toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () => _changeCoinAddition(
                                              coin.valueCt,
                                              1,
                                            ),
                                            child: const Icon(
                                              Icons.arrow_drop_up,
                                              color: Colors.green,
                                              size: 28,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => _changeCoinAddition(
                                              coin.valueCt,
                                              -1,
                                            ),
                                            child: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.red,
                                              size: 28,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return Text('$error');
                    },
                    loading: () {
                      return const Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: _depositCoins,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      child: const Text(
                        'Einzahlen',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bist du dir sicher?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Alle Daten (Snacks, Geld) werden auf Standardwerte zurückgesetzt!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Abbrechen'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .read(insertedMoneyProvider.notifier)
                                        .resetStock();
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text(
                                    'RESET',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        "RESET",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
