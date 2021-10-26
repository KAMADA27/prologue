import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputMasks {
  static MaskTextInputFormatter cpf = MaskTextInputFormatter(
      mask: '999.999.999-99', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter cnpj = MaskTextInputFormatter(
      mask: '99.999.999/9999-99', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter phone = MaskTextInputFormatter(
      mask: '(99) 9 9999-9999', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter landlinePhone = MaskTextInputFormatter(
      mask: '(99) 9999-9999', filter: {'9': RegExp(r'^[0-9]')});
  static TextInputFormatter currency = TextInputFormatter.withFunction(
    (oldValue, newValue) {
      String newText = newValue.text
        .replaceAll('.', '')
        .replaceAll(',', '')
        .replaceAll('_', '')
        .replaceAll('-', '');

      String value = newText;
      int cursorPosition = newText.length;

      if (newText.isNotEmpty) {
        value = _formatCurrency(
          double.parse(newText),
        );
        cursorPosition = value.length;
      }

      return TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(
          offset: cursorPosition,
        ),
      );
  });
  static MaskTextInputFormatter cep = MaskTextInputFormatter(
      mask: '99.999-999', filter: {'9': RegExp(r'^[0-9]')});
}

String _formatCurrency(num value) {
  ArgumentError.checkNotNull(value, 'value');

  value = value / 100;

  return NumberFormat.currency(
    customPattern: '###,###.##',
    locale: 'pt_BR',
  ).format(value);
}
