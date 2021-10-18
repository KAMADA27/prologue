import 'package:flutter/material.dart';

const _textHeaderColor = Color(0xFF00B7D2);
const _bodyTextColor = Color(0xFF4F4E50);
const _subTitleTextColor = Color(0xFF3E3E3E);

class ThemeDataSB {
  static ThemeData get defaultTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: "Montserrat",
      textTheme: const TextTheme(
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
          color: _textHeaderColor,
          fontSize: 24.0,
        ),
      ),
    );
  }
}

class TextFormFieldSB extends StatelessWidget {
  /// Hold a class of type [Validator]
  /// That should implement a string validation of the given text
  final Validator validatorDelegate;

  ///  * Learn how to use a [TextEditingController] in one of our [cookbook recipes](https://flutter.dev/docs/cookbook/forms/text-field-changes#2-use-a-texteditingcontroller).
  final TextEditingController? controller;

  const TextFormFieldSB({
    Key? key,
    required this.validatorDelegate,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: validatorDelegate.maxLength,
      validator: validatorDelegate.validate,
      keyboardType: validatorDelegate.textInputType,
      focusNode: validatorDelegate.focusNode,
    );
  }
}

abstract class Validator {
  late final int maxLength;
  late final FocusNode? focusNode;
  late final TextInputType textInputType;

  String? validate(String? text);
}

class CPFValidatorDelegate implements Validator {
  @override
  late final FocusNode? focusNode;

  @override
  late TextInputType textInputType = TextInputType.number;

  @override
  int maxLength = 11;

  CPFValidatorDelegate({this.focusNode});

  @override
  String? validate(String? text) {
    return text ?? "";
  }
}
