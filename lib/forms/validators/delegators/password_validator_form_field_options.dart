import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prologue/forms/validators/form_field_options.dart';

class PasswordValidatorDelegate implements FormFieldOptions {
  final String _invalidPassword = 'Senha inválido';
  final String _invalidLength = 'Necessário 6 dígitos';

  @override
  late final FocusNode? focusNode;

  @override
  late TextInputType textInputType = TextInputType.number;

  @override
  String? validate({String? text = '', bool mandatory = false}) {
    if (text!.isEmpty && mandatory) {
      return _invalidPassword;
    }

    if (text.length < 6) {
      return _invalidLength;
    }
  }

  PasswordValidatorDelegate({this.focusNode});

  @override
  List<TextInputFormatter>? inputMasks;
}
