import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:flutter/src/material/input_decorator.dart';
import 'package:prologue/forms/validators/validator.dart';

class CnpjValidatorDelegate implements Validator {
  final String _cnpjMandatory = 'CNPJ obrigatório';
  final String _cnpjInvalidFormat = 'Formato do CNPJ inválido';
  final String _cnpjInvalid = 'CNPJ inválido';

  @override
  FocusNode? focusNode;

  @override
  InputDecoration? inputDecoration = const InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelText: 'Número do CNPJ',
      hintText: '00.000.000/0000-00');

  @override
  TextInputType textInputType = TextInputType.number;

  @override
  String? validate({String? text = '', bool mandatory = false}) {
    if (mandatory && text!.isEmpty) {
      return _cnpjMandatory;
    }
    String cnpj = checkFormatAndRemoveInvalidCharacters(text);
    if (cnpj.isEmpty || cnpj.length != 14) {
      return _cnpjInvalidFormat;
    }
    if (!_isValidString(cnpj)) {
      return _cnpjInvalid;
    }
    String numbers = cnpj.substring(0, 12);
    numbers += verifyDigit(numbers).toString();
    numbers += verifyDigit(numbers).toString();

    if (cnpj.substring(cnpj.length - 2) ==
        numbers.substring(numbers.length - 2)) {
      return null;
    } else {
      return _cnpjInvalid;
    }
  }

  String checkFormatAndRemoveInvalidCharacters(String? cnpj) {
    cnpj = RegExp(r'^\d{2}.\d{3}.\d{3}\/\d{4}-\d{2}$')
        .stringMatch(cnpj.toString());
    cnpj = cnpj == null ? '' : cnpj.replaceAll(RegExp(r'[^0-9]'), '');
    return cnpj;
  }

  bool _isValidString(String cnpj) {
    final sameRepeatedNumbers = RegExp(r'(?!(\d)\1{13})\d{14}');
    return sameRepeatedNumbers.hasMatch(cnpj);
  }

  int verifyDigit(String cnpj) {
    int index = 2;
    final reverse = cnpj
        .split('')
        .reversed
        .map((String number) => int.parse(number))
        .toList();

    final sum = reverse.fold(0, (int value, int number) {
      value += number * index;
      index = index == 9 ? 2 : index + 1;
      return value;
    });

    int mod = sum % 11;
    return mod < 2 ? 0 : 11 - mod;
  }
}
