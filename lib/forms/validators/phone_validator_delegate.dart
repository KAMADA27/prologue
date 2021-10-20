import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:prologue/forms/validators/validator.dart';

class PhoneValidatorDelegate implements Validator {
  final String _phoneMandatory = 'O telefone é obrigatório';
  final String _phoneFormatInvalid = 'O formato do telefone é invalido';

  @override
  FocusNode? focusNode;

  @override
  InputDecoration? inputDecoration = const InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelText: 'Telefone',
      hintText: '(00) 00000-0000');

  @override
  TextInputType textInputType = TextInputType.number;

  @override
  String? validate({String? text = '', bool mandatory = false}) {
    String phone = text!.replaceAll(RegExp(r'[^0-9]'), '');
    if (mandatory && phone.isEmpty) {
      return _phoneMandatory;
    }
    if (phone.isEmpty || text.length < 10) {
      return _phoneFormatInvalid;
    }
    if (phone.length >= 10) {
      return null;
    } else {
      return _phoneFormatInvalid;
    }
  }
}
