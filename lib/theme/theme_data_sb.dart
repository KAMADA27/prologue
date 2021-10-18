import 'package:flutter/material.dart';

class ThemeDataSB {
  static ThemeData getThemeData() {
    return ThemeData(
        primarySwatch: Colors.blue,
        textTheme:
            const TextTheme(headline1: TextStyle(color: Color(0xFF00CCFF))));
  }
}
