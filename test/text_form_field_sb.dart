import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prologue/theme/theme_data_sb.dart';

void main() {
  testWidgets('Validator call', (WidgetTester tester) async {
    final _formKey = GlobalKey<FormState>();
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: TextFormFieldSB(
          key: _formKey,
          controller: TextEditingController(text: "teste"),
          validator: CPFValidator(),
        ),
      ),
    ));

    await tester.pump();

    if (_formKey.currentState!.validate()) {
      print("aaa");
    }

  });
}
