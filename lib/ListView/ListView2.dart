import 'package:flutter/material.dart';

class Listview2 extends StatelessWidget {
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  Listview2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView.builder')),
        body: ListView.builder(
          itemCount: items.length, // Total items
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}