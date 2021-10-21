import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prologue/enums/form_field_type_sb.dart';
import 'package:prologue/forms/inputs/text_form_field_sb.dart';
import 'package:prologue/forms/masks/cpf_input_mask.dart';
import 'package:prologue/theme/theme_data_sb.dart';

void main() {
  Widget _makeTestableFormField(Widget widget) {
    return MaterialApp(
      theme: ThemeDataSB.defaultTheme,
      home: Scaffold(
        body: Form(
          child: widget,
        ),
      ),
    );
  }

  testWidgets("Should validate form filed mask by type",
      (WidgetTester tester) async {
    const String validCPF = "992.779.480-00";
    const String unMaskedValidCPF = "99277948000";
    final _controller = TextEditingController();
    final formfieldSB = _makeTestableFormField(
      TextFormFieldSB(
        controller: _controller,
        formFieldTypeSB: FormFieldTypeSB.cpf,
        hintText: "CPF",
        labelText: "000.000.000-00",
      ),
    );
    await tester.pumpWidget(formfieldSB);

    final found = find.byType(TextFormFieldSB);
    final widget = tester.firstWidget(found) as TextFormFieldSB;

    await tester.enterText(found, unMaskedValidCPF);

    await tester.pump();

    expect(found, findsOneWidget);
    expect(widget.formFieldTypeSB, FormFieldTypeSB.cpf);
    expect(widget.formFieldOptions.inputMasks!.first, InputMasks.cpfMask);
    expect(widget.controller!.text, validCPF);
  });
}
