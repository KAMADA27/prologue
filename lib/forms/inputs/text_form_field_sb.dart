import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prologue/forms/masks/cpf_input_mask.dart';
import 'package:prologue/forms/validators/validator.dart';

class TextFormFieldSB extends StatelessWidget {
  /// Hold a class of type [Validator]
  /// That should implement a string validation of the given text
  final Validator validatorDelegate;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;
  final InputDecoration _defaultInputDecoration = const InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always);

  const TextFormFieldSB(
      {Key? key,
      required this.validatorDelegate,
      this.controller,
      this.inputDecoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: validatorDelegate.maxLength,
      validator: validatorDelegate.validate,
      keyboardType: validatorDelegate.textInputType,
      focusNode: validatorDelegate.focusNode,
      decoration: inputDecoration ?? _defaultInputDecoration,
      inputFormatters: [InputMasks.cpfMask],
    );
  }
}
