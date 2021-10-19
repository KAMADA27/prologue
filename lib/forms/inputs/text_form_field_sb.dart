import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prologue/forms/masks/cpf_input_mask.dart';
import 'package:prologue/forms/validators/validator.dart';

class TextFormFieldSB extends StatelessWidget {
  /// Hold a class of type [Validator]
  /// That should implement a string validation of the given text
  final Validator validatorDelegate;
  final bool? mandatory;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;
  // TODO: IR PARA O TEMA
  final InputDecoration _defaultInputDecoration = const InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always);

  const TextFormFieldSB(
      {Key? key,
      required this.validatorDelegate,
      this.controller,
      this.inputDecoration,
      this.mandatory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (text) =>
          validatorDelegate.validate(text: text, mandatory: mandatory ?? false),
      keyboardType: validatorDelegate.textInputType,
      focusNode: validatorDelegate.focusNode,
      decoration: inputDecoration,
      inputFormatters: [InputMasks.cpfMask],
    );
  }
}
