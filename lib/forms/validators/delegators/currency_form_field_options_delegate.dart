import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:prologue/forms/masks/masks.dart';
import 'package:prologue/forms/validators/form_field_options.dart';

class CurrencyFormFieldOptionsDelegate implements FormFieldOptions {
  @override
  FocusNode? focusNode;

  @override
  List<TextInputFormatter>? inputMasks = [InputMasks.currency];

  @override
  TextInputType textInputType = TextInputType.number;

  @override
  String? validate({String? text, bool mandatory = false}) {
    return null;
  }
}