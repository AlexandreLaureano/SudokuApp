import 'package:flutter/material.dart';
import 'package:sudoku_app/Telas/HomePage.dart';

class GameOverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 200),
        child: Center(
          child: Column(
            children: [
              Text('Game Over'),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('Jogar Novamente'))
            ],
          ),
        ),
      ),
    );
  }
}
