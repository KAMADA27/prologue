import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prologue/forms/inputs/text_form_field_sb/form_field_type_enum_sb.dart';
import 'package:prologue/forms/inputs/text_form_field_sb/text_form_field_sb.dart';
import 'package:prologue/forms/masks/masks.dart';
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

  group('Should validate form filed mask by type', () {
    testWidgets("Type CPF", (WidgetTester tester) async {
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
      expect(widget.formFieldOptions.inputMasks!.first, InputMasks.cpf);
      expect(widget.controller!.text, validCPF);
      expect(find.text(validCPF), findsOneWidget);
    });

    testWidgets("Type CNPJ", (WidgetTester tester) async {
      const String validCNPJ = "81.135.147/0001-90";
      const String unMaskedCNPJ = "81135147000190";
      final _controller = TextEditingController();
      final formfieldSB = _makeTestableFormField(
        TextFormFieldSB(
          controller: _controller,
          formFieldTypeSB: FormFieldTypeSB.cnpj,
          hintText: "CNPJ",
          labelText: "00.000.000/0000-00",
        ),
      );
      await tester.pumpWidget(formfieldSB);

      final found = find.byType(TextFormFieldSB);
      final widget = tester.firstWidget(found) as TextFormFieldSB;

      await tester.enterText(found, unMaskedCNPJ);

      await tester.pump();

      expect(found, findsOneWidget);
      expect(widget.formFieldTypeSB, FormFieldTypeSB.cnpj);
      expect(widget.formFieldOptions.inputMasks!.first, InputMasks.cnpj);
      expect(widget.controller!.text, validCNPJ);
      expect(find.text(validCNPJ), findsOneWidget);
    });

    testWidgets("Type Phone", (WidgetTester tester) async {
      const String validPhoneFormat = "(11) 1 1111-1111";
      const String unMaskedPhone = "11111111111";
      final _controller = TextEditingController();
      final formfieldSB = _makeTestableFormField(
        TextFormFieldSB(
            controller: _controller,
            formFieldTypeSB: FormFieldTypeSB.phone,
            labelText: 'Telefone',
            hintText: '(00) 0 0000-0000'),
      );
      await tester.pumpWidget(formfieldSB);

      final found = find.byType(TextFormFieldSB);
      final widget = tester.firstWidget(found) as TextFormFieldSB;

      await tester.enterText(found, unMaskedPhone);

      await tester.pump();

      expect(found, findsOneWidget);
      expect(widget.formFieldTypeSB, FormFieldTypeSB.phone);
      expect(widget.formFieldOptions.inputMasks!.first, InputMasks.phone);
      expect(widget.controller!.text, validPhoneFormat);
      expect(find.text(validPhoneFormat), findsOneWidget);
    });
  });
}
