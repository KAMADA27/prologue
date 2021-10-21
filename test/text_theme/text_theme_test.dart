import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prologue/theme/theme_data_sb.dart';

class _BodyText1Test {
  static double fontSize = 16;
}

class _BodyText2Test {
  static double fontSize = 16;
}

class _Headline6Test {
  static double fontSize = 24;
}

class _Subtitle1Test {
  static double fontSize = 14.0;
  static Color color = const Color(0xFF3E3E3E);
}

class _Subtitle2Test {
  static double fontSize = 12.0;
  static Color color = const Color(0xFF3E3E3E);
}

const String _fontFamily = 'Montserrat';

void main() {
  Widget _materialAppWithTheme(Widget widget) {
    return MaterialApp(theme: ThemeDataSB.defaultTheme, home: widget);
  }

  testWidgets("Title / Título", (WidgetTester tester) async {
    final titleWidget = _materialAppWithTheme(
      Builder(
        builder: (context) => Text(
          "Titulo",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );

    await tester.pumpWidget(titleWidget);

    final Finder found = find.byType(Text);
    final Text widget = tester.firstWidget(found) as Text;

    expect(found, findsOneWidget);
    expect(widget.style!.fontFamily, _fontFamily);
    expect(widget.style!.fontSize, _Headline6Test.fontSize);
  });

  testWidgets("BodyText 1 / Corpo Texto 1", (WidgetTester tester) async {
    final bodyWidget = _materialAppWithTheme(
      Builder(
        builder: (context) => Text(
          "bodytext1",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );

    await tester.pumpWidget(bodyWidget);

    final Finder found = find.byType(Text);
    final Text widget = tester.firstWidget(found) as Text;

    expect(found, findsOneWidget);
    expect(widget.style!.fontFamily, _fontFamily);
    expect(widget.style!.fontSize, _BodyText1Test.fontSize);
  });

  testWidgets("BodyText 2 / Corpo Texto 2", (WidgetTester tester) async {
    final bodyWidget = _materialAppWithTheme(
      Builder(
        builder: (context) => Text(
          "bodytext2",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );

    await tester.pumpWidget(bodyWidget);

    final Finder found = find.byType(Text);
    final Text widget = tester.firstWidget(found) as Text;

    expect(found, findsOneWidget);
    expect(widget.style!.fontFamily, _fontFamily);
    expect(widget.style!.fontSize, _BodyText2Test.fontSize);
  });

  testWidgets("Subtitle 1 / Subtitulo 2", (WidgetTester tester) async {
    final bodyWidget = _materialAppWithTheme(
      Builder(
        builder: (context) => Text(
          "subtitle1",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );

    await tester.pumpWidget(bodyWidget);

    final Finder found = find.byType(Text);
    final Text widget = tester.firstWidget(found) as Text;

    expect(found, findsOneWidget);
    expect(widget.style!.fontFamily, _fontFamily);
    expect(widget.style!.fontSize, _Subtitle1Test.fontSize);
    expect(widget.style!.color, _Subtitle1Test.color);
  });

  testWidgets("Subtitle 2 / Subtitulo 2", (WidgetTester tester) async {
    final bodyWidget = _materialAppWithTheme(
      Builder(
        builder: (context) => Text(
          "subtitle1",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    );

    await tester.pumpWidget(bodyWidget);

    final Finder found = find.byType(Text);
    final Text widget = tester.firstWidget(found) as Text;

    expect(found, findsOneWidget);
    expect(widget.style!.fontFamily, _fontFamily);
    expect(widget.style!.fontSize, _Subtitle2Test.fontSize);
    expect(widget.style!.color, _Subtitle2Test.color);
  });
}
