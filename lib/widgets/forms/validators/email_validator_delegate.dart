import 'package:flutter/material.dart';

import './validator.dart';

class EmailValidatorDelegate implements Validator {
  final String _invalidEmail = 'E-mail inválido';

  @override
  late final FocusNode? focusNode;

  @override
  late InputDecoration? inputDecoration = const InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: 'E-mail',
    hintText: 'E-mail'
  );

  @override
  late TextInputType textInputType = TextInputType.emailAddress;

  @override
  String? validate({ String? text = '', bool mandatory = false }) {
    if (text!.isEmpty && mandatory) {
      return _invalidEmail;
    }

    if (!_isValidEmail(text)) {
      return _invalidEmail;
    }
  }

  EmailValidatorDelegate({ this.focusNode });

  bool _isValidEmail(String email) {
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailPattern.hasMatch(email)) {
      return false; 
    }

    return true;
  }
}