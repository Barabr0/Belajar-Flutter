
import 'package:flutter/material.dart';
import 'package:throught_1/Navigator.dart';
import 'package:throught_1/Task/Task5.dart';
import 'package:throught_1/routes/app_routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute : '/',
      routes : AppRoutes.routes,
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