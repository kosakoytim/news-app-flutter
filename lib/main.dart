import 'package:flutter/material.dart';
import 'package:news_app_flutter/constant/Styling.dart';
import 'package:news_app_flutter/screen/home/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: COLOR_BLUE,
      ),
      home: HomeScreen(),
      routes: {
        '/home-screen': (BuildContext context) => HomeScreen(),
      },
    );
  }
}