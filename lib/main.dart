import 'package:flutter/material.dart';
import 'package:throught_1/ListView/ListView2.dart';
import 'package:throught_1/ListView/Listview1.dart';
import 'package:throught_1/Task/task4.dart';
import 'package:throught_1/container/ContainerSatu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Flutter App"),
        //   backgroundColor: Colors.amber,
        //   centerTitle: true,
        // ),
        body: Task4(),
      ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const HelloWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Hello Flutter", style: TextStyle(
        fontSize: 30, 
        fontWeight: FontWeight.bold, 
        color: Colors.cyan
        ),),
    );
  }
}