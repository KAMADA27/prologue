import 'package:flutter/material.dart';

import 'package:prologue/enums/button.dart';
import 'package:prologue/models/prop.dart';

import 'package:prologue/catalog/widget_details.dart';
import 'package:prologue/widgets/buttons/text_button_sb/text_button_sb.dart';

class TextButtonDocSB extends StatelessWidget {
  const TextButtonDocSB({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final propList = [
      Prop(
        type: 'Key?',
        name: ' Key',
        description: 'Controla como um widget substitui outro widget na árvore.',
        required: false
      ),
      Prop(
        type: 'String',
        name: ' text',
        description: 'Texto que será mostrado no botão.',
        required: true
      ),
      Prop(
        type: 'Function',
        name: ' onPressed',
        description: 'Chamada de função quando o botão é pressionado.',
        required: true,
      ),
      Prop(
        type: 'ButtonType?',
        name: ' type',
        description: 'Tipo do botão para mudança de estilização.',
        required: false
      ),
      Prop(
        type: 'bool?',
        name: ' underline',
        description: 'Para adição de sublinhado no texto.',
        required: false
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Text button'),
      ),
      body: WidgetDetails(
        description: 'Botão de texto sem fundo visível.', 
        propList: propList, 
        preview: const Preview()
      )
    );
  }
}

class Preview extends StatelessWidget {
  const Preview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextButtonSB(
          text: 'Text button',
          onPressed: () {}
        ),
        TextButtonSB(
          text: 'Text button',
          onPressed: () {},
          underline: true,
        ),
        TextButtonSB(
          text: 'Text button',
          onPressed: () {},
          type: ButtonType.secondary,
        ),
        TextButtonSB(
          text: 'Text button',
          onPressed: () {},
          type: ButtonType.danger,
        )
      ],
    );
  }
}