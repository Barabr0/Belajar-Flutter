import 'package:flutter/material.dart';
import 'package:throught_1/ListView/Listview1.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment : MainAxisAlignment.center,
      children : [
        ElevatedButton(
          onPressed : () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder : (context) {
                   return Listview1();
                  }  
                )
            );
          },
          child : Text("List view 1")
        )
      ]
    );
  }
}