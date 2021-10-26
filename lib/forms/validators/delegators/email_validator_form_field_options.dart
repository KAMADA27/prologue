import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:prologue/forms/validators/form_field_options.dart';

class EmailValidatorDelegate implements FormFieldOptions {
  final String _invalidEmail = 'E-mail inválido';

  @override
  late final FocusNode? focusNode;

  @override
  late TextInputType textInputType = TextInputType.emailAddress;

  @override
  List<TextInputFormatter>? inputMasks;

  @override
  String? validate({String? text = '', bool mandatory = false}) {
    if (text!.isEmpty && mandatory) {
      return _invalidEmail;
    }

    if (!_isValidEmail(text)) {
      return _invalidEmail;
    }
  }

  EmailValidatorDelegate({this.focusNode});

  bool _isValidEmail(String email) {
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailPattern.hasMatch(email)) {
      return false;
    }

    return true;
  }
}
