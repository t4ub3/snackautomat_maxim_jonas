import 'package:flutter/material.dart';
import 'package:snackautomat/models/snack.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.grey[400],
          foregroundColor: Colors.black,
          side: const BorderSide(color: Colors.black),
          shape: const RoundedRectangleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ProduktFach extends StatelessWidget {
  final Snack snack;
  final VoidCallback onTap;

  const ProduktFach({
    super.key,
    required this.snack,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
        ),

        child: Column(
          children: [
            Expanded(
              child: Image.file(snack.image),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(), right: BorderSide()),
                    ),
                    child: const Center(
                      child: Text('3 St.', style: TextStyle(fontSize: 10)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide()),
                    ),
                    child: Center(
                      child: Text(
                        '${snack.price}€',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Coin {
  final String name;
  final int stock;
  final int added;

  Coin({
    required this.name,
    required this.stock,
    this.added = 0,
  });
}
