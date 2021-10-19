import 'package:flutter/material.dart';

import '../enums/button.dart';
class RoundedButtonSB extends StatelessWidget {
  final String text;
  final Function callback;
  final ButtonType? type;
  final ButtonSize? size;

  const RoundedButtonSB({
    Key? key,
    required this.text,
    required this.callback,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
  }) : super(key: key);

  double _getButtonWidth() {
    switch (size) {
      case ButtonSize.small:
        return 120;
      case ButtonSize.medium:
        return 220;
      case ButtonSize.large:
        return 312;
      default: 
        return 220;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final buttonWidth = _getButtonWidth();
    const buttonHeight = 48.0;
    final ButtonStyle roundedButtonStyle = TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      fixedSize: Size(buttonWidth, buttonHeight)
    );
    final primaryButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: const Color(0xFF02b7d2),
    );
    final secondaryButtonStyle = TextButton.styleFrom(
      primary: const Color(0xFF02b7d2),
      backgroundColor: Colors.white,
      side: const BorderSide(color: Color(0xFF02b7d2))
    );

    ButtonStyle _getButtonStyle() {
      switch (type) {
        case ButtonType.primary:
          return roundedButtonStyle.merge(
            primaryButtonStyle
          );
        case ButtonType.secondary:
          return roundedButtonStyle.merge(
            secondaryButtonStyle
          );
        default:
          return roundedButtonStyle.merge(
            primaryButtonStyle
          );
      }
    }

    return TextButton(
      onPressed: () => callback(), 
      child: Text(text),
      style: _getButtonStyle()
    );
  }
}

