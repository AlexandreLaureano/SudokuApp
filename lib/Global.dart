import 'package:flutter/material.dart';

class Global {
  static getWidth(context) => MediaQuery.of(context).size.width;

  static getHeight(context) => MediaQuery.of(context).size.height;
}
