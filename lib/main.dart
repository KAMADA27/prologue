import 'package:flutter/material.dart';
import 'package:prologue/forms/inputs/text_form_field_sb/form_field_type_enum_sb.dart';
import 'package:prologue/forms/inputs/text_form_field_sb/text_form_field_sb.dart';
import 'package:prologue/theme/theme_data_sb.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Storybook(
        children: [
          Story(
            name: 'Flat button',
            padding: EdgeInsets.all(5), // optional padding customization
            background: Colors.red, // optional background color customization
            builder: (_, k) =>
                MaterialButton(
                  onPressed: k.boolean(label: 'Enabled', initial: true)
                      ? () {}
                      : null,
                  child: Text(k.text(label: 'Text', initial: 'Flat button')),
                ),
          ),
          Story(
            name: 'Raised button',
            builder: (_, k) =>
                RaisedButton(
                  onPressed: k.boolean(label: 'Enabled', initial: true)
                      ? () {}
                      : null,
                  color: k.options(
                    label: 'Color',
                    initial: Colors.deepOrange,
                    options: const [
                      Option('Red', Colors.deepOrange),
                      Option('Green', Colors.teal),
                    ],
                  ),
                  textColor: Colors.white,
                  child: Text(k.text(label: 'Text', initial: 'Raised button')),
                ),
          ),
          Story.simple(
            name: 'Input field',
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input field',
              ),
            ),
          ),
          Story(
            name: "TextFormFieldSB",
            builder: (context, kb) {
              return Form(
                child: TextFormFieldSB(
                  labelText: "TextFieldName",
                  hintText: "TextFieldHint", formFieldTypeSB: FormFieldTypeSB.cpf,
                ),
              );
            },
          )
        ],
      );
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeDataSB.defaultTheme,
//       darkTheme: ThemeDataSB.defaultTheme,
//       themeMode: ThemeMode.dark,
//       home: Catalog(),
//     );
//   }
// }

class Catalog extends StatelessWidget {
  Catalog({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormFieldSB(
                      controller: _controller,
                      onChanged: (text) {
                        print(_controller.text);
                      },
                      mandatory: true,
                      formFieldTypeSB: FormFieldTypeSB.cpf,
                      labelText: "Número de CNPJ",
                      hintText: "99.999.999/9999-99",
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  _formKey.currentState!.validate();
                },
                child: const Text("OK"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
