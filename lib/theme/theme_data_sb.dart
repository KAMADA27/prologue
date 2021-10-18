import 'package:flutter/material.dart';

class ThemeDataSB {
  static ThemeData getThemeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }
}

class TextFormFieldSB extends StatelessWidget {
  /// Hold a class of type [Validator]
  /// That should implement a string validation of the given text
  final Validator validator;
  final TextEditingController? controller;

  const TextFormFieldSB({
    Key? key,
    required this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator.validate,
    );
  }
}

abstract class Validator {
  String? validate(String? text);
}

class CPFValidator implements Validator {
  @override
  String? validate(String? text) {
    print(text);
    return text ?? "";
  }
}
