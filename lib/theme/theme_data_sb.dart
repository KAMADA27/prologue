import 'package:flutter/material.dart';

class ThemeDataSB {
  static ThemeData getThemeData() {
    return ThemeData(
        primarySwatch: Colors.blue,
        textTheme:
            const TextTheme(headline1: TextStyle(color: Color(0xFF00CCFF))));
  }
}

class TextFormFieldSB extends StatelessWidget {
  /// Hold a class of type [Validator]
  /// That should implement a string validation of the given text
  final Validator validatorDelegate;
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
