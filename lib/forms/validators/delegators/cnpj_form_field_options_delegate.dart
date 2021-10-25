import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prologue/forms/masks/masks.dart';
import 'package:prologue/forms/validators/form_field_options.dart';
import 'package:prologue/utils/string_utils.dart';

class CnpjFormFieldOptionsDelegate implements FormFieldOptions {
  @override
  FocusNode? focusNode;

  @override
  List<MaskTextInputFormatter>? inputMasks = [InputMasks.cnpj];

  final String _invalidValue = "CNPJ inválido";

  final String _mandatoryValue = "O campo CNPJ é obrigatório";

  final String _invalidValueFormat = "O formato inserido é inválido";

  @override
  TextInputType textInputType = TextInputType.number;

  @override
  String? validate({String? text = '', bool mandatory = false}) {
    if (mandatory && text!.isEmpty) {
      return _mandatoryValue;
    }

    if (!_hasValidNumberSequence(text ?? "")) {
      return _invalidValueFormat;
    }

    if (!_hasValidCNPJ(text ?? "")) {
      return _invalidValue;
    }
  }

  /// Analisa o dígito verificador do CNPJ
  ///
  /// Informar cadeia de caracteres para testar o dígito.
  int _verifyDigitsCNPJ(String string) {
    const int base = 11;
    int currentWeight = 1;
    final int sum = string
        .split('')
        .reversed
        .map((element) {
          if (currentWeight >= 9) {
            currentWeight = 1;
          }
          currentWeight++;
          return int.parse(element) * currentWeight;
        })
        .fold(0, (int previousValue, element) => previousValue + element)
        .toInt();

    final int module = sum % base;
    final value = base - module;

    return value >= 10 ? 0 : value;
  }

  /// Efetua a validação se o valor apresentado como dígito verificador
  /// é igual a da validação.
  bool _hasValidCNPJ(String string) {
    String digits = StringUtils.digitsOnly(string);
    StringBuffer registrationBloc = StringBuffer();
    registrationBloc
        .write(_verifyDigitsCNPJ(digits.characters.take(12).string));
    registrationBloc
        .write(_verifyDigitsCNPJ(digits.characters.take(13).string));

    return registrationBloc.toString() ==
        string.substring(string.length - 2, string.length);
  }

  /// Check's if the current text string is valid
  bool _hasValidNumberSequence(String cnpj) {
    if (cnpj.isEmpty || StringUtils.digitsOnly(cnpj).length != 14) return false;
    final sameRepeatedNumbers = RegExp(r'(?!(\d)\1{13})\d{14}');
    return sameRepeatedNumbers.hasMatch(StringUtils.digitsOnly(cnpj));
  }
}
