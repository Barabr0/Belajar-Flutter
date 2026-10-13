import 'package:flutter/material.dart';

class Gridview3 extends StatelessWidget {
  const Gridview3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title: const Text("Grid 3 / Extend"),),
        body: GridView.extent(
          maxCrossAxisExtent: 100,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.all(10),
          children: List.generate(
            8,
            (index) => Container(
              color: Colors.orangeAccent,
              child: Center(
                child: Text(
                  'Item $index',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}