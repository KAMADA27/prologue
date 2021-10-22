import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prologue/forms/validators/validator.dart';

abstract class FormFieldOptions {
  late final FocusNode? focusNode;
  late final TextInputType textInputType;
  late final List<MaskTextInputFormatter>? inputMasks;

  String? validate({String? text, bool mandatory = false});

}
