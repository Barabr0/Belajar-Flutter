import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title : Text('Home Page')),
      body : Center(
        child : Column(
          children : [
            ElevatedButton(
              onPressed : () {
                Navigator.pushNamed(context, '/about');
              },
              child : Text('Masuk Profile'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed :() {
                  Navigator.pushNamed(context, '/listview1');
                },
                child : Text('Masuk Listview'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed :() {
                Navigator.pushNamed(context, '/task5');
              },
              child : Text('Masuk Task 5'),
            ),          
            SizedBox(height: 20),
            ElevatedButton(
              onPressed :() {
                Navigator.pushNamed(context, '/ArticleListScreen');
              },
              child : Text('Masuk Article List'),
            ),          
            SizedBox(height: 20),
            ElevatedButton(
              onPressed :() {
                Navigator.pushNamed(context, '/GridProductPage');
              },
              child : Text('Masuk Grid List'),
            ),            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed :() {
                Navigator.pushNamed(context, '/ContainerSatu');
              },
              child : Text('Masuk ContainerSatu'),
            ),            
          ]
        )
      )
    );
  }
}