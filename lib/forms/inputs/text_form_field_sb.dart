import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prologue/forms/validators/form_field_options_sb.dart';
import 'package:prologue/forms/validators/validator_settings.dart';

class TextFormFieldSB extends StatelessWidget {
  /// Hold a class of type [FormFieldOptions]
  /// That should implement a string validation of the given text
  late final FormFieldOptions _formFieldOptions;
  final bool? mandatory;
  final TextEditingController? controller;
  final int? maxLength;
  final String hintText;
  final String labelText;
  late final FormFieldTypeSB formFieldTypeSB;
  late final List<TextInputFormatter>? inputFormatters;

  TextFormFieldSB({
    Key? key,
    this.controller,
    this.mandatory,
    this.maxLength,
    this.inputFormatters,
    required this.formFieldTypeSB,
    required this.hintText,
    required this.labelText,
  }) : super(key: key) {
    _formFieldOptions = ValidatorSettings.getByFormFieldType(
      formFieldTypeSB,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      validator: (text) =>
          _formFieldOptions.validate(text: text, mandatory: mandatory ?? false),
      keyboardType: _formFieldOptions.textInputType,
      focusNode: _formFieldOptions.focusNode,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
      inputFormatters: (FormFieldTypeSB.none == formFieldTypeSB)
          ? inputFormatters
          : _formFieldOptions.inputMasks,
    );
  }
}
