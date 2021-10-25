import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prologue/forms/validators/validator.dart';

/// Abstraction to implement a FormFieldOptionsDelegate class
/// holds the required properties and validation to a [TextFormFieldSB].
///
///
/// See the available inputMasks on the [InputMasks] class.
abstract class FormFieldOptions {
  late final FocusNode? focusNode;
  late final TextInputType textInputType;
  late final List<MaskTextInputFormatter>? inputMasks;

  /// Validation of the [TextFormFieldSB]
  ///
  /// This validator is called by the key of type [FormState] on [TextFormFieldSB].
  /// If not needed the validate method should return null;
  ///
  /// Returns a string when a validate() method is called.
  /// ```dart
  ///   @override
  ///   String? validate({String? text = '', bool mandatory = false}) {
  ///     if (mandatory && text.isEmpty) {
  ///       return 'This field cannot be empty';
  ///     }
  ///     return null;
  ///   }
  /// ```
  String? validate({String? text, bool mandatory = false});

}
