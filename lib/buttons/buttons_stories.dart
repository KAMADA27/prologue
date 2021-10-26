import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:prologue/enums/button.dart';

import 'package:prologue/buttons/text_button_sb.dart';
import 'package:prologue/buttons/rounded_button_sb.dart';
import 'package:prologue/buttons/icon_button_sb.dart';

class ButtonStories {
  List<Story> buttonStoriesList = [
    Story(
      name: 'Text Button SB', 
      section: 'Button',
      builder: (context, k) => TextButtonSB(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        text: k.text(label: 'Texto', initial: 'Clique aqui!'),
        type: k.options(
          label: 'Tipo do botão', 
          initial: ButtonType.primary,
          options: const [
            Option('primary', ButtonType.primary),
            Option('secondary', ButtonType.secondary),
            Option('danger', ButtonType.danger)
          ]
        ),
        underline: k.boolean(
          label: 'Sublinhado', 
          initial: false
        ),
      ),
    ),
    Story(
      name: 'Rounded Button SB',
      section: 'Button',
      builder: (_, k) => RoundedButtonSB(
        onPressed: () {},
        text: k.text(label: 'Texto', initial: 'Clique aqui!'),
        size: k.options(
          label: 'Tamanho', 
          initial: ButtonSize.medium,
          options: const [
            Option('Pequeno', ButtonSize.small),
            Option('Médio', ButtonSize.medium),
            Option('Largo', ButtonSize.large)
          ]
        ),
        type: k.options(
          label: 'Tipo do botão', 
          initial: ButtonType.primary,
          options: const [
            Option('primary', ButtonType.primary),
            Option('secondary', ButtonType.secondary)
          ]
        ),
      ),
    ),
    Story(
      name: 'Icon Button SB',
      section: 'Button', 
      builder: (_, k) => IconButtonSB(
        onPressed: () {},
        icon: Icons.add,
        text: k.text(label: 'Texto', initial: 'Clique aqui'), 
      )
    )
  ];
}