import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// * Português
///
/// Abstração para implementação das classes FormFieldOptionsDelegate
/// na qual detem propriedades e validação para o widget [TextFormFieldSB].
///
/// Veja os inputMasks disponíveis na classe [InputMasks].
///
/// * English
///
/// Abstraction to implement a FormFieldOptionsDelegate class
/// holds the required properties and validation to a [TextFormFieldSB].
///
///
/// See the available inputMasks on the [InputMasks] class.
abstract class FormFieldOptions {
  late final FocusNode? focusNode;
  late final TextInputType textInputType;
  late final List<TextInputFormatter>? inputMasks;

  /// * Português
  ///
  /// Validação para o [TextFormFieldSB], sobreescreve a propriedade 'validator' [FormFieldValidator]
  /// do [TextFormField] nativo.
  ///
  /// O método validador deve ser chamado pela chave do tipo [FormState] no [TextFormFieldSB]
  /// caso não seja necessário deve retornar null.
  ///
  /// Retorna uma string quando GlobalKey<FormState>().currentState.validate() method is called.
  ///
  /// * English
  ///
  /// Validation of the [TextFormFieldSB], overrides the 'validator' [FormFieldValidator] property
  /// of native [TextFormField].
  ///
  /// This validate method must be called by the key of type [FormState] on [TextFormFieldSB].
  /// If not needed the validate method should return null;
  ///
  /// Returns a string when a GlobalKey<FormState>().currentState.validate() method is called.
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
