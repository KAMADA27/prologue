import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prologue/widgets/forms/inputs/text_form_field_sb.dart';

import 'package:prologue/widgets/forms/validators/password_validator_delegate.dart';



void main() {
  testWidgets('Validator call', (WidgetTester tester) async {
    final _formKey = GlobalKey<FormState>();
    final _controller = TextEditingController();
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Form(
          key: _formKey,
          child: TextFormFieldSB(
            controller: _controller,
            validatorDelegate: PasswordValidatorDelegate(),
          ),
        ),
      ),
    ));

    await tester.pump();

    if (_formKey.currentState!.validate()) {
      print("aaa");
    }
  });
}
