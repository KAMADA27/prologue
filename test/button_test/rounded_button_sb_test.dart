import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prologue/widgets/buttons/rounded_button_sb.dart';

import 'package:prologue/enums/button.dart';

Widget _makeTestable(Widget widget) => MaterialApp(home: widget);

void main() {
  testWidgets("Rounded button test", (WidgetTester tester) async {
    var pressed = false;

    final widget = RoundedButtonSB(text: 'Click me', onPressed: () {
      pressed = true;
    });

    await tester.pumpWidget(_makeTestable(widget));
    await tester.tap(find.byType(TextButton));

    final roundedButton = tester.widget<RoundedButtonSB>(
      find.byType(RoundedButtonSB)
    );

    expect(find.byType(RoundedButtonSB), findsOneWidget);
    expect(find.text('Click me'), findsOneWidget);
    expect(pressed, true);
    expect(roundedButton.type, ButtonType.primary);
    expect(roundedButton.size, ButtonSize.medium);
  });  
}