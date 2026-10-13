import 'package:flutter/material.dart';

class Listview1 extends StatelessWidget {
  const Listview1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView 1")),
      body: ListView(
          children: [
            ListTile(title: Text('Item 1'),),
            ListTile(title: Text('Item 2'),),
            ListTile(title: Text('Item 3'),),
          ]
      )
    );
  }
}                     
            