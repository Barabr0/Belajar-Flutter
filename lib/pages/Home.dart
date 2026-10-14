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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed :() {
                Navigator.pushNamed(context, '/ColumnWidget');
              },
              child : Text('Masuk Column Widget'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed :() {
                Navigator.pushNamed(context, '/RowAja');
              },
              child : Text('Masuk Row Widget'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed :() {
                Navigator.pushNamed(context, '/RowColumnWidget');
              },
              child : Text('Masuk Row Column Widget'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed :() {
                Navigator.pushNamed(context, '/Stackwidget');
              },
              child : Text('Masuk Stack Widget'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed :() {
                Navigator.pushNamed(context, '/Expandedwidget');
              },
              child : Text('Masuk Expanded Widget'),
            ),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed :() {
            //     Navigator.pushNamed(context, '/Sizedboxwidget');
            //   },
            //   child : Text('Masuk Sized Box Widget'),
            // ),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed :() {
            //     Navigator.pushNamed(context, '/Gridhi');
            //   },
            //   child : Text('Masuk Grid hi'),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed :() {
                Navigator.pushNamed(context, '/formulir');
              },
              child : Text('Masuk Formulir'),
            ),
          ]
        )
      )
    );
  }
}