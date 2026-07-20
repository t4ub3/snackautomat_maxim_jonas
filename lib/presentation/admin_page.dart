import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          TableRow(
            children: [
              Text(
                'Snack',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Preis', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Vorrat', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          TableRow(
            children: [
              Text('Nüsse'),
              Text('2.50€'),
              Text('10'),
            ],
          ),
          TableRow(
            children: [
              Text('Haribo'),
              Text('3.50'),
              Text('2'),
            ],
          ),
        ],
      ),
    );
  }
}
