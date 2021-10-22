import 'package:flutter/material.dart';

import 'package:prologue/widgets/buttons/text_button_sb/text_button_doc_sb.dart';

const String textButtonScreen = 'text-button';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case textButtonScreen:
      return MaterialPageRoute(builder: (context) => const TextButtonDocSB());
    default:
      throw('Rota inexistente');
  }
}