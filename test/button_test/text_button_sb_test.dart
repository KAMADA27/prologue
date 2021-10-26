import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prologue/buttons/text_button_sb.dart';

import 'package:prologue/buttons/button_enum.dart';

Widget _makeTestable(Widget widget) => MaterialApp(home: widget);

void main() {
  testWidgets("Text button test", (WidgetTester tester) async {
    var pressed = false;

    final widget = TextButtonSB(text: 'Click me', onPressed: () {
      pressed = true;
    });

    await tester.pumpWidget(_makeTestable(widget));
    await tester.tap(find.byType(TextButton));

    final textButton = tester.widget<TextButtonSB>(
      find.byType(TextButtonSB)
    );

    expect(find.byType(TextButtonSB), findsOneWidget);
    expect(find.text('Click me'), findsOneWidget);
    expect(pressed, true);
    expect(textButton.type, ButtonType.primary);
    expect(textButton.underline, false);
  });  
}