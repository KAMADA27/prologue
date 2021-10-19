import 'package:flutter/material.dart';
import 'package:prologue/buttons/text_button_sb.dart';
import 'package:prologue/enums/button.dart';
import 'package:prologue/forms/inputs/text_form_field_sb.dart';
import 'package:prologue/forms/validators/cpf_validator_delegate.dart';
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
                child: TextFormFieldSB(
                  validatorDelegate: CPFValidatorDelegate(),
                  controller: TextEditingController(),
                  inputDecoration: CPFValidatorDelegate().inputDecoration,
                  mandatory: true,
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
