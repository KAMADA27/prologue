import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prologue/forms/validators/form_field_options.dart';

class TextFormFieldOptionsDelegate implements FormFieldOptions {
  @override
  FocusNode? focusNode;

  @override
  List<MaskTextInputFormatter>? inputMasks;

  @override
  TextInputType textInputType = TextInputType.text;

  @override
  String? validate({String? text, bool mandatory = false}) {
    return null;
  }
}
