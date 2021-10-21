import 'package:prologue/enums/form_field_type_sb.dart';
import 'package:prologue/forms/validators/cpf_form_field_options_delegate.dart';
import 'package:prologue/forms/validators/form_field_options.dart';

class FormFieldDelegateSettings {
  static FormFieldOptions getByFormFieldType(FormFieldTypeSB formFieldType) {
    switch (formFieldType) {
      case FormFieldTypeSB.cpf:
        return CpfFormFieldOptionsDelegate();
      case FormFieldTypeSB.none:
      default:
        return CpfFormFieldOptionsDelegate();
    }
  }
}
