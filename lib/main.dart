import 'package:flutter/material.dart';
import 'package:prologue/forms/validators/cpf_validator_delegate.dart';
import 'package:prologue/theme/theme_data_sb.dart';

import 'forms/inputs/text_form_field_sb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeDataSB.defaultTheme,
      darkTheme: ThemeDataSB.defaultTheme,
      themeMode: ThemeMode.dark,
      home: const Catalog(),
    );
  }
}

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeContext = Theme.of(context).textTheme;
    // final _themeContext = ThemeDataSB.defaultTheme.textTheme;
    const String _exampleText =
        "Para completar seu cadastro informe o código que enviamos por SMS para o número +55 34 99165-1896.";

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Título",
            style: _themeContext.headline6,
          ),
          Text(
            "Subtítulo",
            style: _themeContext.subtitle1,
          ),
          Text(
            "Para acessar sua conta no Cartões Social Bank, informe sua a senha de acesso.",
            style: _themeContext.subtitle1,
          ),
          Text(
            "Corpo 1",
            style: _themeContext.bodyText1,
          ),
          Text(
            _exampleText,
            style: _themeContext.bodyText1,
          ),
          Text(
            "Corpo 2",
            style: _themeContext.bodyText2,
          ),
          Text(
            _exampleText,
            style: _themeContext.bodyText2,
          ),
        ],
      ),
    );
  }
}
