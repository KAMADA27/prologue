import 'package:prologue/forms/validators/cpf_validator_delegate.dart';
import 'package:prologue/forms/validators/form_field_options_sb.dart';

enum FormFieldTypeSB {
  cpf,
  cnpj,
  password,
  email,
  none,
}

class ValidatorSettings {
  static FormFieldOptions getByFormFieldType(FormFieldTypeSB formFieldType) {
    switch (formFieldType) {
      case FormFieldTypeSB.cpf:
        return CPFValidatorDelegate();
      case FormFieldTypeSB.none:
      default:
        return CPFValidatorDelegate();
    }
  }
}
