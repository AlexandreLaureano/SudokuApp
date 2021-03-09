import 'package:flutter/material.dart';
import 'package:sudoku_app/Global.dart';
import 'package:sudoku_app/Widgets/ButtonCustom.dart';

class Teclado extends StatefulWidget {
  int numSelecionado = 1;
  String toolSelec = 'pn';
  @override
  _TecladoState createState() => _TecladoState();
}

class _TecladoState extends State<Teclado> {
  String _active = '1';
  String _activeTool = 'pn';

// ValueChanged<String> callback
  void active(String btn) {
    widget.numSelecionado = int.parse(btn);
    setState(() {
      _active = btn;
      activeTool('pn');
    });
  }

  void activeTool(String btn) {
    widget.toolSelec = btn;
    setState(() => _activeTool = btn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Global.getHeight(context) * 0.25,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonCustom(
                action: active,
                text: '1',
                active: _active == "1" ? true : false,
                isNumber: true,
              ),
              ButtonCustom(
                action: active,
                text: '2',
                active: _active == "2" ? true : false,
                isNumber: true,
              ),
              ButtonCustom(
                action: active,
                text: '3',
                active: _active == "3" ? true : false,
                isNumber: true,
              ),
              ButtonCustom(
                action: activeTool,
                text: 'pn',
                imageData: 'assets/pen.png',
                active: _activeTool == "pn" ? true : false,
                isNumber: false,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonCustom(
                action: active,
                text: '4',
                active: _active == "4" ? true : false,
                isNumber: true,
              ),
              ButtonCustom(
                action: active,
                text: '5',
                active: _active == "5" ? true : false,
                isNumber: true,
              ),
              ButtonCustom(
                action: active,
                text: '6',
                active: _active == "6" ? true : false,
                isNumber: true,
              ),
              ButtonCustom(
                action: activeTool,
                text: 'pc',
                imageData: 'assets/pencil.png',
                active: _activeTool == "pc" ? true : false,
                isNumber: false,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonCustom(
                action: active,
                text: '7',
                active: _active == "7" ? true : false,
                isNumber: true,
              ),
              ButtonCustom(
                action: active,
                text: '8',
                active: _active == "8" ? true : false,
                isNumber: true,
              ),
              ButtonCustom(
                action: active,
                text: '9',
                active: _active == "9" ? true : false,
                isNumber: true,
              ),
              ButtonCustom(
                action: activeTool,
                text: 'er',
                imageData: 'assets/eraser.png',
                active: _activeTool == "er" ? true : false,
                isNumber: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
