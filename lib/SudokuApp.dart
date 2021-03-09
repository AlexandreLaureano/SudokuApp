import 'package:flutter/material.dart';
import 'package:sudoku_app/Telas/HomePage.dart';

class SudokuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Color.alphaBlend(
              Color.fromRGBO(64, 75, 96, .9), Color.fromRGBO(80, 80, 100, .8)),
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
          textTheme: TextTheme(
              subtitle2: TextStyle(color: Colors.white),
              subtitle1: TextStyle(color: Colors.white))),
      home: HomePage(),
    );
  }
}
