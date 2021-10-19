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
      theme: ThemeDataSB.getThemeData(),
      home: Scaffold(
        body: Center(child: Catalog()),
      ),
    );
  }
}

class Catalog extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormFieldSB(
              validatorDelegate: CPFValidatorDelegate(),
              controller: TextEditingController(),
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
    );
  }
}
