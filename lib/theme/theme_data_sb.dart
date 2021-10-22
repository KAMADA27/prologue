import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prologue/constants/colors_sb.dart';
import 'package:prologue/constants/fonts_sb.dart';

class ThemeDataSB {
  static ThemeData get defaultTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: "Montserrat",
      errorColor: ColorsSB.errorColor,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(
          color: ColorsSB.subtitleColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsSB.subtitleColor,
          ),
        ),
        hintStyle: TextStyle(
          fontSize: FontsSB.medium,
          color: ColorsSB.hintColor,
        ),
        labelStyle: TextStyle(
          fontSize: FontsSB.medium,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: ColorsSB.bodyColor,
          fontSize: FontsSB.medium,
        ),
        bodyText2: TextStyle(
          color: ColorsSB.bodyColor,
          fontWeight: FontWeight.w200,
          fontSize: FontsSB.medium,
        ),
        subtitle1: TextStyle(
          color: ColorsSB.subtitleColor,
          fontSize: FontsSB.small,
        ),
        subtitle2: TextStyle(
          color: ColorsSB.subtitleColor,
          fontSize: FontsSB.extraSmall,
        ),
        headline6: TextStyle(
          color: ColorsSB.primaryColor,
          fontSize: FontsSB.large,
        ),
      ),
    );
  }
}
