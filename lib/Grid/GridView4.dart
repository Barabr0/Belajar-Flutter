import 'package:flutter/material.dart';

class Gridhi extends StatelessWidget {
  const Gridhi({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        appBar: AppBar(title: const Text("Grid 4 / image")),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjR8D4uxOZDle8V77TvmkYid8fuiKs2NzL4EiE4o4Gvg&s=10',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
    );
  }
}
