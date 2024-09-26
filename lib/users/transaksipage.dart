import 'package:flutter/material.dart';

class Transaksipage extends StatefulWidget {
  @override
  State<Transaksipage> createState() => _TransaksipageState();
}

class _TransaksipageState extends State<Transaksipage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Transaksi'),
      ),
      body: Center(
        child: const Text(
          'Transaksipage',
        ),
      ),
    );
  }
}
