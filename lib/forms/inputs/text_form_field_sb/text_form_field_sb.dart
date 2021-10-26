import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prologue/forms/inputs/text_form_field_sb/form_field_type_enum_sb.dart';
import 'package:prologue/forms/validators/form_field_options.dart';
import 'package:prologue/forms/validators/delegators/form_field_options_delegate_settings.dart';

/// It is a custom [TextFormField] to Social Bank
/// This TextFormField will hold a class [FormFieldOptions]
/// set by the [FormFieldTypeSB].
///
/// As the type is set the input configuration and masks are applied
class TextFormFieldSB extends StatelessWidget {
  late final FormFieldOptions _formFieldOptions;
  final bool? mandatory;
  final TextEditingController? controller;
  final int? maxLength;
  final String hintText;
  final String labelText;
  final Function(String)? onChanged;
  late final FormFieldTypeSB formFieldTypeSB;
  late final List<TextInputFormatter>? inputFormatters;

  /// TextFormFieldSB
  ///
  /// Aqui falhou Construtor
  TextFormFieldSB({
    Key? key,
    this.controller,
    this.mandatory,
    this.maxLength,
    this.onChanged,
    this.inputFormatters,
    required this.formFieldTypeSB,
    required this.hintText,
    required this.labelText,
  }) : super(key: key) {
    _formFieldOptions = FormFieldDelegateSettings.getByFormFieldType(
      formFieldTypeSB,
    );
  }

  FormFieldOptions get formFieldOptions => _formFieldOptions;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      onChanged: onChanged,
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
