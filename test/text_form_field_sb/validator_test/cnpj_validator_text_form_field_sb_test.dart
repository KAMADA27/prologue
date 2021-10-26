import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prologue/forms/inputs/text_form_field_sb/form_field_type_enum_sb.dart';
import 'package:prologue/forms/inputs/text_form_field_sb/text_form_field_sb.dart';

void main() {
  testWidgets('Fields of Type CNPJ should be mandatory', (WidgetTester tester) async {
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
      labelText: "CNPJ",
      hintText: "",
      mandatory: true,
      formFieldTypeSB: FormFieldTypeSB.cnpj,
    ));

    await tester.pumpWidget(formSB);

    final found = find.byType(TextFormFieldSB);
    await tester.enterText(found, "");
    _formKey.currentState!.validate();
    await tester.pump();

    expect(find.text("O campo CNPJ é obrigatório"), findsOneWidget);
  });

  testWidgets('Should validate a invalid CNPJ, wrong final digit', (WidgetTester tester) async {
    final _formKey = GlobalKey<FormState>();
    const String invalidCNPJ = "08087566000103";

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
      labelText: "CNPJ",
      hintText: "",
      mandatory: true,
      formFieldTypeSB: FormFieldTypeSB.cnpj,
    ));

    await tester.pumpWidget(formSB);

    final found = find.byType(TextFormFieldSB);
    await tester.enterText(found, invalidCNPJ);
    _formKey.currentState!.validate();
    await tester.pump();

    expect(find.text("CNPJ inválido"), findsOneWidget);
  });

  testWidgets('Should validate the format of CNPJ with same numbers', (WidgetTester tester) async {
    final _formKey = GlobalKey<FormState>();
    const String invalidCNPJ = "00000000000000";

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
      labelText: "CNPJ",
      hintText: "",
      mandatory: true,
      formFieldTypeSB: FormFieldTypeSB.cnpj,
    ));

    await tester.pumpWidget(formSB);

    final found = find.byType(TextFormFieldSB);
    await tester.enterText(found, invalidCNPJ);
    _formKey.currentState!.validate();
    await tester.pump();

    expect(find.text("O formato inserido é inválido"), findsOneWidget);
  });

  testWidgets('Should validate the format of CNPJ with missed numbers', (WidgetTester tester) async {
    final _formKey = GlobalKey<FormState>();
    const String invalidCNPJ = "0440001000000";

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
      labelText: "CNPJ",
      hintText: "",
      mandatory: true,
      formFieldTypeSB: FormFieldTypeSB.cnpj,
    ));

    await tester.pumpWidget(formSB);

    final found = find.byType(TextFormFieldSB);
    await tester.enterText(found, invalidCNPJ);
    _formKey.currentState!.validate();
    await tester.pump();

    expect(find.text("O formato inserido é inválido"), findsOneWidget);
  });
}
