import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prologue/forms/inputs/text_form_field_sb/form_field_type_enum_sb.dart';
import 'package:prologue/forms/inputs/text_form_field_sb/text_form_field_sb.dart';

void main() {
  test('description', () {

  });

  testWidgets('Should validate a invalida CNPJ', (WidgetTester tester) async {
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

    expect(find.text("Campo CNPJ é obrigatório"), findsOneWidget);
  });
}
