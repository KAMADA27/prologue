import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prologue/forms/masks/masks.dart';
import 'package:prologue/forms/validators/form_field_options.dart';

class PhoneFormFieldOptionsDelegate implements FormFieldOptions {
  final String _phoneMandatory = 'O telefone é obrigatório';
  final String _phoneFormatInvalid = 'O formato do telefone é invalido';

  @override
  FocusNode? focusNode;

  @override
  TextInputType textInputType = TextInputType.number;

  @override
  List<TextInputFormatter>? inputMasks = [InputMasks.phone];

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
