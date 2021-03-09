import 'package:flutter/material.dart';
import 'package:sudoku_app/Telas/SudokuPage.dart';
import 'package:sudoku_app/Widgets/Teclado.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Teclado tec = new Teclado();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color.fromRGBO(32, 193, 246, 1),
                  Color.fromRGBO(131, 75, 218, 1)
                ])),
            child: Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 160),
              child: Center(
                  child: Column(
                children: [
                  Text(
                    "SUDOKU",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Container(
                    height: 100,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SudokuPage()));
                    },
                    child: Text(
                      "Jogar",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              )),
            )));
  }
}
