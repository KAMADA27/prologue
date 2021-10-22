import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prologue/forms/masks/masks.dart';
import 'package:prologue/forms/validators/form_field_options.dart';

class CnpjFormFieldOptionsDelegate implements FormFieldOptions {
  @override
  FocusNode? focusNode;

  @override
  List<MaskTextInputFormatter>? inputMasks = [InputMasks.cnpjMask];

  String invalidValue = "CNPJ inválido";

  String invalidValueFormat = "Formato inválido";

  String mandatoryValue = "Campo CNPJ é obrigatório";

  @override
  TextInputType textInputType = TextInputType.number;

  @override
  String? validate({String? text = '', bool mandatory = false}) {
    if (mandatory && text!.isEmpty) {
      return mandatoryValue;
    }
  }
}
