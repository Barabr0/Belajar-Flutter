import 'package:flutter/material.dart';

class Gridview1 extends StatelessWidget {
  const Gridview1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('GridView.count Example')),
        body: GridView.count(
          crossAxisCount: 4, // Jumlah kolom
          crossAxisSpacing: 10, // Jarak antar kolom
          mainAxisSpacing: 10, // Jarak antar baris
          padding: const EdgeInsets.all(10),
          children: List.generate(
            10,
            (index) => Container(
              color: Colors.blueAccent,
              child: Center(
                child: Text(
                  'Item $index',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}