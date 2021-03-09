import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sudoku_app/Sudoku/GridTabuleiro.dart';
import 'package:sudoku_app/Widgets/Teclado.dart';

class SudokuPage extends StatefulWidget {
  final String excecao = "";

  @override
  _SudokuPageState createState() => _SudokuPageState();
}

class _SudokuPageState extends State<SudokuPage> {
  Teclado tec = new Teclado();
  String hora = "00:00";
  DateTime inicio = DateTime.now();
  Timer timer;

  @override
  Widget build(BuildContext context) {
    crono();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Sudoku"),
            //Text(hora),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) => Column(
            children: [
              GridTabuleiro(
                tec: tec,
              ),
              tec,
              // Text(widget.excecao),
            ],
          ),
        ),
      ),
    );
  }

  void crono() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        hora = transformMilliSeconds(
            DateTime.now().difference(inicio).inMilliseconds);
      });
    });
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
