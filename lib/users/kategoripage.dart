import 'package:flutter/material.dart';

class KategoriPage extends StatefulWidget {
  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Kategori'),
      ),
      body: Center(
        child: const Text(
          'KategoriPage',
        ),
      ),
    );
  }
}
