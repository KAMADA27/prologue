import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:prologue/forms/inputs/text_form_field_sb/text_form_field_sb.dart';

import 'package:prologue/forms/inputs/text_form_field_sb/form_field_type_enum_sb.dart';


class InputStories {
  List<Story> inputStoriesList = [
    Story(
      name: 'Text Form Field SB', 
      section: 'Input',
      builder: (_, k) => TextFormFieldSB(
        formFieldTypeSB: k.options(
          label: 'Tipo do campo', 
          initial: FormFieldTypeSB.text,
          options: const [
            Option('Texto', FormFieldTypeSB.text),
            Option('CNPJ', FormFieldTypeSB.cnpj),
            Option('CPF', FormFieldTypeSB.cpf),
            Option('Moeda', FormFieldTypeSB.currency),
            Option('E-mail', FormFieldTypeSB.email),
            Option('Nenhum', FormFieldTypeSB.none),
            Option('Número', FormFieldTypeSB.number),
            Option('Senha', FormFieldTypeSB.password),
            Option('Telefone', FormFieldTypeSB.phone),
          ]
        ), 
        hintText: k.text(label: 'Placeholder', initial: 'Placeholder'), 
        labelText: k.text(label: 'Label', initial: 'Label'),
      )
    )
  ];
}