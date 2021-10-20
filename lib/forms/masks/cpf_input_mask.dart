import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CpfInputMask extends TextInputFormatter {
  RegExp fullCpfExpression =
      RegExp(r'^^[0-9]{3}\.^[0-9]{3}\.^[0-9]{3}\-^[0-9]{2}$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex = newValue.composing.end;
    String _maskedValue = newValue.text;
    if (fullCpfExpression.firstMatch(newValue.text) != null) {
    } else {
      if (RegExp(r'^[0-9]{4}$', multiLine: true).hasMatch(newValue.text)) {
        _maskedValue = newValue.text.substring(0, 3) +
            '.${newValue.text.substring(newValue.text.length - 1)}';
        selectionIndex++;
      }
      if (RegExp(r'^[0-9.\-\/]{8}$').hasMatch(newValue.text)) {
        _maskedValue =
            '${newValue.text.substring(0, 7)}.${newValue.text.substring(newValue.text.length - 1)}';
        selectionIndex++;
      }
      if (RegExp(r'^[0-9.\-\/]{12,13}$').hasMatch(newValue.text)) {
        _maskedValue =
            '${newValue.text.substring(0, 11)}-${newValue.text.substring(11, newValue.text.length)}';
        selectionIndex++;
      }
    }
    return TextEditingValue(
        text: _maskedValue,
        composing: TextSelection.collapsed(offset: selectionIndex));
  }
}

class InputMasks {
  static MaskTextInputFormatter cpfMask = MaskTextInputFormatter(
      mask: '999.999.999-99', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter cnpjMask = MaskTextInputFormatter(
      mask: '99.999.999/9999-99', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter phoneMask = MaskTextInputFormatter(
      mask: '(99) 9 9999-9999', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter currencyMask = MaskTextInputFormatter(
      mask: '999.999.999.999,00', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter cepMask = MaskTextInputFormatter(
      mask: '99.999-999', filter: {'9': RegExp(r'^[0-9]')});
}
