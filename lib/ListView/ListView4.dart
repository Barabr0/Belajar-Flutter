import 'package:flutter/material.dart';

class Listview4 extends StatelessWidget {
  final List<String> images = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];

  // const Listview4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ListView 4 / custom")),
        body: ListView.builder( 
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(images[index]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Image ${index + 1}'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
