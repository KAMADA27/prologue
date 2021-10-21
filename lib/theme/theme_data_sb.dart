import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _primaryColor = Color(0xFF00B7D2);
const _bodyTextColor = Color(0xFF4F4E50);
const _subTitleTextColor = Color(0xFF3E3E3E);
const _errorColor = Color(0xFFF70808);
const _hintColor = Color(0xFF99989A);

const _bodyTextFontSize = 16.0;
const _hintStyleFontSize = 16.0;
const _labelStyleFontSize = 16.0;
const _headline6FontSize = 24.0;
const _subtitle1FontSize = 14.0;
const _subtitle2FontSize = 12.0;

class ThemeDataSB {
  static ThemeData get defaultTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: "Montserrat",
      errorColor: _errorColor,
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(
          color: _subTitleTextColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: _subTitleTextColor,
          ),
        ),
        hintStyle: TextStyle(
          fontSize: _hintStyleFontSize,
          color: _hintColor,
        ),
        labelStyle: TextStyle(
          fontSize: _labelStyleFontSize,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      textTheme: const TextTheme(
        button: TextStyle(
          color: _primaryColor,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          color: _bodyTextColor,
          fontSize: _bodyTextFontSize,
        ),
        bodyText2: TextStyle(
          color: _bodyTextColor,
          fontWeight: FontWeight.w200,
          fontSize: _bodyTextFontSize,
        ),
        subtitle1: TextStyle(
          color: _subTitleTextColor,
          fontSize: _subtitle1FontSize,
        ),
        subtitle2: TextStyle(
          color: _subTitleTextColor,
          fontSize: _subtitle2FontSize,
        ),
        headline6: TextStyle(
          color: _primaryColor,
          fontSize: _headline6FontSize,
        ),
      ),
    );
  }
}
