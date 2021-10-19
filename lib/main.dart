import 'package:flutter/material.dart';
import 'package:prologue/buttons/text_button_sb.dart';
import 'package:prologue/enums/button.dart';
import 'package:prologue/theme/theme_data_sb.dart';

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
    const String _subExampleText =
        "Para acessar sua conta no Cartões Social Bank, informe sua a senha de acesso.";

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Título",
            style: _themeContext.headline6,
          ),
          Text(
            "Subtitulo 1 \n$_subExampleText",
            style: _themeContext.subtitle1,
          ),
          Text(
            "Subtítulo 2 \n$_subExampleText",
            style: _themeContext.subtitle2,
          ),
          Text(
            "Corpo 1 \n$_exampleText",
            style: _themeContext.bodyText1,
          ),
          Text(
            "Corpo 2 \n$_exampleText",
            style: _themeContext.bodyText2,
          ),
          TextButtonSB(
            onPressed: () {
              print("sayyy");
            },
            text: "Button",
          ),
          TextButtonSB(
            onPressed: () {},
            text: "Button 2",
            type: ButtonType.secondary,
          ),
          TextButtonSB(
            onPressed: () {},
            text: "DAN GUE ROUX",
            type: ButtonType.danger,
          ),
        ],
      ),
    );
  }
}
