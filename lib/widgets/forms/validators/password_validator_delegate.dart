import 'package:flutter/material.dart';

import './validator.dart';

class PasswordValidatorDelegate implements Validator {
  final String _invalidPassword = 'Senha inválido';
  final String _invalidLength = 'Necessário 6 dígitos';

  @override
  late final FocusNode? focusNode;

  @override
  late InputDecoration? inputDecoration = const InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: 'Senha',
    hintText: 'Senha'
  );

  @override
  late TextInputType textInputType = TextInputType.number;

  @override
  String? validate({ String? text = '', bool mandatory = false }) {
    if (text!.isEmpty && mandatory) {
      return _invalidPassword;
    }

    if (text.length < 6) {
      return _invalidLength;
    }
  }

  PasswordValidatorDelegate({ this.focusNode });
}