import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputMasks {
  static MaskTextInputFormatter cpfMask = MaskTextInputFormatter(
      mask: '999.999.999-99', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter cnpjMask = MaskTextInputFormatter(
      mask: '99.999.999/9999-99', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter phoneMask = MaskTextInputFormatter(
      mask: '(99) 9 9999-9999', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter landlinePhoneMask = MaskTextInputFormatter(
      mask: '(99) 9999-9999', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter currencyMask = MaskTextInputFormatter(
      mask: '999.999.999.999,00', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter cepMask = MaskTextInputFormatter(
      mask: '99.999-999', filter: {'9': RegExp(r'^[0-9]')});
}
