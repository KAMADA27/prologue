import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prologue/forms/validators/form_field_options.dart';

class PhoneValidatorDelegate implements FormFieldOptions {
  final String _phoneMandatory = 'O telefone é obrigatório';
  final String _phoneFormatInvalid = 'O formato do telefone é invalido';

  @override
  FocusNode? focusNode;

  @override
  InputDecoration? inputDecoration = const InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelText: 'Telefone',
      hintText: '(00) 0 0000-0000');

  @override
  TextInputType textInputType = TextInputType.number;

  @override
  List<MaskTextInputFormatter>? inputMasks;

  @override
  String? validate({String? text = '', bool mandatory = false}) {
    String phone = text!.replaceAll(RegExp(r'[^0-9]'), '');
    if (mandatory && phone.isEmpty) {
      return _phoneMandatory;
    }
    if (phone.isEmpty || phone.length < 11) {
      return _phoneFormatInvalid;
    }
    if (phone.length >= 11) {
      return null;
    }
  }


}
