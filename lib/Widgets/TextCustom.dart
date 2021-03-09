import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String texto;
  final bool editavel;
  final bool certo;
  const TextCustom({Key key, this.texto, this.editavel, this.certo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.texto,
      style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: !editavel
              ? Colors.black
              : certo
                  ? Colors.black38
                  : Colors.red),
    );
  }
}
