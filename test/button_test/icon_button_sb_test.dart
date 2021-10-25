import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prologue/widgets/buttons/icon_button_sb.dart';

Widget _makeTestable(Widget widget) => MaterialApp(home: widget);

void main() {
  testWidgets("Icon button test", (WidgetTester tester) async {
    var pressed = false;

    final widget = IconButtonSB(icon: Icons.visibility, onPressed: () {
      pressed = true;
    });

    await tester.pumpWidget(_makeTestable(widget));
    await tester.tap(find.byType(TextButton));

    final iconButton = tester.widget<IconButtonSB>(
      find.byType(IconButtonSB)
    );

    expect(find.byType(IconButtonSB), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsOneWidget);
    expect(pressed, true);
  });
}