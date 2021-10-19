import 'package:flutter/material.dart';

import '../enums/button.dart';

class TextButtonSB extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final ButtonType? type;
  final bool? underline;

  const TextButtonSB({
    Key? key, 
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.underline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final ButtonStyle textButtonStyle = TextButton.styleFrom(
      splashFactory: NoSplash.splashFactory
    );
    final primaryButtonStyle = TextButton.styleFrom(
      primary: theme.textTheme.button?.color,
    );
    final secondaryButtonStyle = TextButton.styleFrom(
      primary: const Color(0xFF8f8d90)
    );
    final dangerButtonStyle = TextButton.styleFrom(
      primary: theme.errorColor
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
      onPressed: onPressed,
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