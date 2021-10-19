import 'package:flutter/material.dart';

import '../enums/button.dart';

class TextButtonSB extends StatelessWidget {
  final String text;
  final Function callback;
  final ButtonType? type;
  final bool? underline;

  const TextButtonSB({
    Key? key, 
    required this.text,
    required this.callback,
    this.type = ButtonType.primary,
    this.underline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle textButtonStyle = TextButton.styleFrom(
      splashFactory: NoSplash.splashFactory
    );
    final primaryButtonStyle = TextButton.styleFrom(
      primary: const Color(0xFF02b7d2)
    );
    final secondaryButtonStyle = TextButton.styleFrom(
      primary: const Color(0xFF8f8d90)
    );
    final dangerButtonStyle = TextButton.styleFrom(
      primary: const Color(0xFFF70808)
    );

    ButtonStyle _getButtonStyle() {
      switch (type) {
        case ButtonType.primary:
          return textButtonStyle.merge(
            primaryButtonStyle
          );
        case ButtonType.secondary:
          return textButtonStyle.merge(
            secondaryButtonStyle
          );
        case ButtonType.danger:
          return textButtonStyle.merge(
            dangerButtonStyle
          );
        default:
          return textButtonStyle.merge(
            primaryButtonStyle
          );
      }
    }

    TextDecoration _underlineHandler() {
      if (underline == null || underline == false) {
        return TextDecoration.none;
      }

      return TextDecoration.underline;
    }

    return TextButton(
      onPressed: () => callback(),
      child: Text(
        text,
        style: TextStyle(
          decoration: _underlineHandler()
        )
      ),
      style: _getButtonStyle()
    );
  }
}