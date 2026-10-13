import 'package:flutter/material.dart';
import 'package:throught_1/ListView/Listview1.dart';
import 'package:throught_1/Task/Task5.dart';
import 'package:throught_1/container/ContainerSatu.dart';
import 'package:throught_1/list%20&%20Grid/Grid.dart';
import 'package:throught_1/list%20&%20Grid/list_screen.dart';
import 'package:throught_1/pages/About.dart';
import 'package:throught_1/pages/Home.dart';

class AppRoutes {
  static const home = '/';
   static const list = '/listview1';
   static const about = '/about';
   static const IG = '/task5';
  static const listScreen = '/ArticleListScreen';
  static const GridScreen = '/GridProductPage';
  static const ContainerScreen = '/ContainerSatu';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    list: (context) => const Listview1(),
    about: (context) => const AboutPage(),
    IG: (context) =>  Task5(),
    listScreen: (context) => const ArticleListScreen(),
    GridScreen: (context) => const GridProductPage(),
    ContainerScreen: (context) => const ContainerSatu(),
  };
}