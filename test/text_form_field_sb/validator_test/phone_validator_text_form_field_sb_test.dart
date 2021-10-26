import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prologue/forms/inputs/text_form_field_sb/form_field_type_enum_sb.dart';
import 'package:prologue/forms/inputs/text_form_field_sb/text_form_field_sb.dart';

void main() {
  testWidgets('Should validate a phone format', (WidgetTester tester) async {
    final _formKey = GlobalKey<FormState>();

    Widget _makeTestableFormField(Widget widget) {
      return MaterialApp(
        home: Scaffold(
          body: Form(
            key: _formKey,
            child: widget,
          ),
        ),
      );
    }

    final formSB = _makeTestableFormField(TextFormFieldSB(
      labelText: "Número de Telefone",
      hintText: "(00) 0 0000-0000",
      formFieldTypeSB: FormFieldTypeSB.phone,
    ));

    await tester.pumpWidget(formSB);

    final found = find.byType(TextFormFieldSB);
    await tester.enterText(found, "34 9 9999-1234");
    _formKey.currentState!.validate();
    await tester.pump();

    expect(find.text("(34) 9 9999-1234".toString()), findsOneWidget);
  });

}
