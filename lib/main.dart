import 'package:flutter/material.dart';
import 'package:prologue/forms/inputs/text_form_field_sb.dart';
import 'package:prologue/theme/theme_data_sb.dart';

import 'forms/validators/validator_settings.dart';

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
      home: Catalog(),
    );
  }
}

class Catalog extends StatelessWidget {
  Catalog({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();

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
                    TextFormField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                          hintText: "Heading",
                          labelText:
                              "Headinggggggggggggggggggggggggggggggggggggg"),
                    ),
                    TextFormFieldSB(
                      controller: TextEditingController(),
                      mandatory: true,
                      formFieldType: FormFieldTypeSB.cnpj,
                      labelText: "Número de CPF",
                      hintText: "000.000.000-00",
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
