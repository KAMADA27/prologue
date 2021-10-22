import 'package:flutter/material.dart';

import 'package:prologue/widgets/forms/validators/validator.dart';

class TextFormFieldSB extends StatelessWidget {
  /// Hold a class of type [Validator]
  /// That should implement a string validation of the given text
  final Validator validatorDelegate;
  final bool? mandatory;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;
  final int? maxLength;

  // TODO: IR PARA O TEMA
  final InputDecoration _defaultInputDecoration = const InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always);

  const TextFormFieldSB({
    Key? key,
    required this.validatorDelegate,
    this.controller,
    this.inputDecoration,
    this.mandatory,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      validator: (text) =>
          validatorDelegate.validate(text: text, mandatory: mandatory ?? false),
      keyboardType: validatorDelegate.textInputType,
      focusNode: validatorDelegate.focusNode,
      decoration: inputDecoration,
    );
  }
}
