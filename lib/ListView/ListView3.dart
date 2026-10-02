import 'package:flutter/material.dart';

class Listview3 extends StatelessWidget {
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView 3 / seperated')),
        body: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(items[index]));
          },
          separatorBuilder: (context, index) {
            return Divider(color: Colors.grey,);
          },
        ),
      ),
    );
  }
}
