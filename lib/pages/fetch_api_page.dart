import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<Album> fetchAlbum() async{
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    headers: {'accept' : 'application/json'},
  );

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String,dynamic>);
  }else {
    throw Exception('Failed to Load Album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId,required this.id,required this.title});

  factory Album.fromJson(Map<String,dynamic> json) {
    return switch (json){
      { 'userId' : int userId, 'id' : int id, 'title' : String title } => Album(
        userId: userId,
        id: id,
        title: title,
      ),
      _=> throw const FormatException('Failed to load Album'),
    };
  }
}

class AlbumPage extends StatefulWidget {
  const new({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Future<Album> futureAlbum;

  @override
  void initState(){
    super.initState();
    futureAlbum = fetchAlbum();
  }
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Fetch Data Example')),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
