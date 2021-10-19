import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF00B7D2);
const _bodyTextColor = Color(0xFF4F4E50);
const _subTitleTextColor = Color(0xFF3E3E3E);

class ThemeDataSB {
  static ThemeData get defaultTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: "Montserrat",
      textTheme: const TextTheme(
        button: TextStyle(
          color: _primaryColor
        ),
        bodyText1: TextStyle(
          color: _bodyTextColor,
          fontSize: 16.0,
        ),
        bodyText2: TextStyle(
          color: _bodyTextColor,
          fontWeight: FontWeight.w200,
          fontSize: 16.0,
        ),
        subtitle1: TextStyle(
          color: _subTitleTextColor,
          fontSize: 14.0,
        ),
        headline6: TextStyle(
          color: _primaryColor,
          fontSize: 24.0,
        ),
      ),
    );
  }
}