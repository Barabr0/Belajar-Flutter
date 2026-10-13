import 'package:flutter/material.dart';

class RowAja extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Isi Row 1"),
        Text("Isi Row 2"),
        Text("Isi Row 3"),
      ]
    );
  }
}