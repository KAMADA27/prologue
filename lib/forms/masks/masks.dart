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
  static MaskTextInputFormatter currency = MaskTextInputFormatter(
      mask: '999.999.999.999,00', filter: {'9': RegExp(r'^[0-9]')});
  static MaskTextInputFormatter cep = MaskTextInputFormatter(
      mask: '99.999-999', filter: {'9': RegExp(r'^[0-9]')});
}
