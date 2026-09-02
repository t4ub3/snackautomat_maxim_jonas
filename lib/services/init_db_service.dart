import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:snackautomat/models/snack.dart';
import 'package:snackautomat/models/transfer.dart';

// default snacks

File _getImg(String name) {
  return File(
    p.normalize(
      p.absolute(p.join("test", "test_assets", "$name.png")),
    ),
  );
}

final List<Snack> defaultSnacks = [
  Snack(
    name: "chipsBbq",
    price: 2.5,
    image: _getImg("chips-bbq-flavour"),
    amount: 10,
  ),
  Snack(
    name: "chocolate",
    price: 2.3,
    image: _getImg("chocolate-bar"),
    amount: 10,
  ),
  Snack(name: "crackers", price: 2.0, image: _getImg("crackers"), amount: 10),
  Snack(
    name: "gummyBears",
    price: 2.0,
    image: _getImg("gummy-bears"),
    amount: 10,
  ),
  Snack(name: "licorice", price: 2.2, image: _getImg("licorice"), amount: 10),
  Snack(
    name: "marshmallows",
    price: 2.8,
    image: _getImg("marshmallows"),
    amount: 10,
  ),
  Snack(
    name: "nutAndBerry",
    price: 2.6,
    image: _getImg("nut-and-berry-mix"),
    amount: 10,
  ),
  Snack(name: "peanut", price: 1.9, image: _getImg("peanut-snacks"), amount: 10),
  Snack(
    name: "chipsSaltPepper",
    price: 2.5,
    image: _getImg("salt-and-pepper-chips"),
    amount: 10,
  ),
];

// default money

final Transfer baseStock = Transfer(
  description: "set base money stock",
  isIncome: true,
  ct5Amount: 10,
  ct10Amount: 10,
  ct20Amount: 10,
  ct50Amount: 10,
  eur1Amount: 10,
  eur2Amount: 10,
  sumInCt: 3850,
);
