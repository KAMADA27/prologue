import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prologue/forms/inputs/text_form_field_sb/form_field_type_enum_sb.dart';
import 'package:prologue/forms/inputs/text_form_field_sb/text_form_field_sb.dart';

void main() {
  testWidgets('Should validate a invalid CPF', (WidgetTester tester) async {
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
      labelText: "Validator",
      hintText: "",
      formFieldTypeSB: FormFieldTypeSB.cpf,
    ));

    await tester.pumpWidget(formSB);

    final found = find.byType(TextFormFieldSB);
    await tester.enterText(found, "00000000000");
    _formKey.currentState!.validate();
    await tester.pump();

    expect(find.text("CPF inválido"), findsOneWidget);
    expect(find.text("000.000.000-00"), findsOneWidget);
  });

  testWidgets('Should validate a invalid CPF', (WidgetTester tester) async {
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
      labelText: "Validator",
      hintText: "",
      formFieldTypeSB: FormFieldTypeSB.cpf,
    ));

    await tester.pumpWidget(formSB);

    final found = find.byType(TextFormFieldSB);
    await tester.enterText(found, "5");
    _formKey.currentState!.validate();
    await tester.pump();

    expect(find.text("Formato de CPF inválido"), findsOneWidget);
  });

  testWidgets('CPF field MUST be mandatory', (WidgetTester tester) async {
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
      labelText: "Validator",
      hintText: "",
      mandatory: true,
      formFieldTypeSB: FormFieldTypeSB.cpf,
    ));

    await tester.pumpWidget(formSB);

    final found = find.byType(TextFormFieldSB);
    await tester.enterText(found, "");
    _formKey.currentState!.validate();
    await tester.pump();

    expect(find.text("CPF obrigatório"), findsOneWidget);
  });
}
