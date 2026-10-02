import 'package:flutter/material.dart';

class Listview5 extends StatelessWidget {
  final List<String> items = ['A', 'B', 'C', 'D', 'E'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ListView 5 / Horizontal"),),
        body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              margin: EdgeInsets.all(8.0),
              color: Colors.blue,
              child: Center(
                child: Text(
                  items[index],
                  style: TextStyle(color: Colors.white,fontSize: 24),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}