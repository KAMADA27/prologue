import 'package:flutter/material.dart';
import 'package:prologue/forms/validators/validator.dart';

class CPFValidatorDelegate implements Validator {
  final String _invalidCpf = 'Cpf inválido';
  final String _invalidFormat = 'Formato de cpf inválido';
  final String _cpfMandatory = 'Cpf obrigatório';

  @override
  late final FocusNode? focusNode;

  @override
  late TextInputType textInputType = TextInputType.number;

  CPFValidatorDelegate({this.focusNode});

  /// Check if CPF has a valid format and remove the non numeric characters
  String checkFormatAndRemoveInvalidCharacters(String? cpf) {
    cpf = RegExp(r'^\d{3}\.\d{3}\.\d{3}\-\d{2}$').stringMatch(cpf.toString());
    cpf = cpf == null ? '' : cpf.replaceAll(RegExp(r'[^0-9]'), '');
    return cpf;
  }

  /// Check's if the current text string is valid
  bool _hasValidNumberSequence(String cpf) {
    final sameRepeatedNumbers = RegExp(r'(?!(\d)\1{10})\d{11}');
    return sameRepeatedNumbers.hasMatch(cpf);
  }

  /// verify de last two digits from CPF to check if is a valid CPF
  verifyDigit(String cpf) {
    final numberList = cpf.split("").map((number) => int.parse(number));
    final modulus = numberList.length + 1;
    final multiplied = List.empty(growable: true);

    numberList.toList().asMap().forEach((index, number) {
      multiplied.add(number * (modulus - index));
    });

    final mod = multiplied.reduce((value, number) => (value + number) % 11);

    return mod < 2 ? 0 : 11 - mod;
  }

  @override
  String? validate({String? text = '', bool mandatory = false}) {
    if (mandatory && text!.isEmpty) {
      return _cpfMandatory;
    }
    String cpf = checkFormatAndRemoveInvalidCharacters(text);
    if (cpf.isEmpty || cpf.length != 11) {
      return _invalidFormat;
    }
    if (!_hasValidNumberSequence(cpf)) {
      return _invalidCpf;
    }
    dynamic numbers = cpf.substring(0, 9);
    numbers += verifyDigit(numbers).toString();
    numbers += verifyDigit(numbers).toString();

    if (numbers == cpf) {
      return null;
    } else {
      return _invalidCpf;
    }
  }

  @override
  InputDecoration? inputDecoration = const InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelText: 'Número do CPF',
      hintText: '000.000.000-00');
}
