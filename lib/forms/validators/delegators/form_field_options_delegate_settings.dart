import 'package:prologue/forms/inputs/text_form_field_sb/form_field_type_enum_sb.dart';

import 'package:prologue/forms/validators/form_field_options.dart';

import 'package:prologue/forms/validators/delegators/cnpj_form_field_options_delegate.dart';
import 'package:prologue/forms/validators/delegators/cpf_form_field_options_delegate.dart';
import 'package:prologue/forms/validators/delegators/currency_form_field_options_delegate.dart';
import 'package:prologue/forms/validators/delegators/phone_form_field_options_delegate.dart';
import 'package:prologue/forms/validators/delegators/text_form_field_options_delegate.dart';

class FormFieldDelegateSettings {
  static FormFieldOptions getByFormFieldType(FormFieldTypeSB formFieldType) {
    switch (formFieldType) {
      case FormFieldTypeSB.cpf:
        return CpfFormFieldOptionsDelegate();
      case FormFieldTypeSB.cnpj:
        return CnpjFormFieldOptionsDelegate();
      case FormFieldTypeSB.phone:
        return PhoneFormFieldOptionsDelegate();
      case FormFieldTypeSB.currency:
        return CurrencyFormFieldOptionsDelegate();
      case FormFieldTypeSB.none:
      default:
        return TextFormFieldOptionsDelegate();
    }
  }
}
