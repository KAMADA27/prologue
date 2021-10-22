import 'package:flutter/src/material/input_decorator.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:flutter/src/widgets/focus_manager.dart';
import 'package:prologue/widgets/forms/validators/validator.dart';


class InputMandatoryDelegate implements Validator {
  @override
  FocusNode? focusNode;

  @override
  InputDecoration? inputDecoration;

  @override
  late TextInputType textInputType;

  @override
  String? validate({String? text = '', bool mandatory = false}) {
    if (text!.isEmpty) {
      return "Campo obrigatório";
    }
  }
}
