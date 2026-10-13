import 'package:flutter/material.dart';

class Sizedboxwidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(),
      body :
    Container(
      child: Column(
        children: [
          Text("Baris 1"),
          SizedBox(height: 20),
          Text("Baris 2"),

          SizedBox(
            height: 20,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Tombol1"),
            ),
          ),
        ]
      )
    )
    );
  }
}