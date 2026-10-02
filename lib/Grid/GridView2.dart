import 'package:flutter/material.dart';

class Gridview2 extends StatelessWidget {
  const Gridview2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Grid 2 / builder")),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.greenAccent,
              child: Text(
                'Item $index',
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            );
          },
        ),
      ),
    );
  }
}
