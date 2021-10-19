import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _primaryColor = Color(0xFF00B7D2);
const _secondaryColor = Color(0xFF8f8d90);
const _bodyTextColor = Color(0xFF4F4E50);
const _subTitleTextColor = Color(0xFF3E3E3E);
const _errorColor = Color(0xFFF70808);

class ThemeDataSB {
  static Color get secondaryColor {
    return _secondaryColor;
  }

  static ThemeData get defaultTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: "Montserrat",
      errorColor: _errorColor,
      textTheme: const TextTheme(
        /// Title
        headline6: TextStyle(
          color: _primaryColor,
          fontSize: 24.0,
        ),
        subtitle1: TextStyle(
          color: _subTitleTextColor,
          fontSize: 14.0,
        ),
        subtitle2: TextStyle(
          color: _subTitleTextColor,
          fontSize: 12.0,
        ),
        button: TextStyle(
          color: _primaryColor,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          color: _bodyTextColor,
          fontSize: 16.0,
        ),
        bodyText2: TextStyle(
          color: _secondaryColor,
        ),
      ),
    );
  }
}
