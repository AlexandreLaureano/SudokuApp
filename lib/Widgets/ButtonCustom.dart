import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  final String text;
  final String tag; //tag of button
  final int fillColor;
  final int textColor;
  final String imageData;
  final double textSize;
  final ValueChanged<String> action; //callback value change  bool selecionado;
  final bool active; // state of button
  final bool isNumber; //true to number false to img

  ButtonCustom(
      {Key key,
      this.text,
      this.fillColor,
      this.textColor = 0xFF658DAC,
      this.textSize = 25,
      this.action,
      this.imageData,
      this.tag,
      this.active,
      this.isNumber})
      : super(key: key);

  @override
  _ButtonCustomState createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  void handleTap() {
    setState(() {
      widget.action(widget.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: SizedBox(
          width: 60,
          height: 45,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: widget.isNumber
                ? Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: widget.textSize,
                    ),
                  )
                : Image.asset(
                    this.widget.imageData,
                    scale: 1,
                  ),
            onPressed: handleTap,
            color: widget.active ? Colors.black26 : Colors.white,
            textColor: widget.active ? Colors.white : Colors.black26,
          ),
        ));
  }
}
