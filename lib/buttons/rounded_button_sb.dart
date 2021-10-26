import 'package:flutter/material.dart';

import 'package:prologue/constants/colors_sb.dart';
import 'package:prologue/enums/button.dart';

class RoundedButtonSB extends StatelessWidget {
  final String text;
  final Function onPressed;
  final ButtonType? type;
  final ButtonSize? size;

  const RoundedButtonSB({
    Key? key,
    required this.text,
    required this.onPressed,
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
      primary: ColorsSB.white,
      backgroundColor: ColorsSB.primaryColor,
    );
    final secondaryButtonStyle = TextButton.styleFrom(
      primary: ColorsSB.primaryColor,
      backgroundColor: ColorsSB.white,
      side: BorderSide(color: ColorsSB.primaryColor)
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
      onPressed: () => onPressed(), 
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      style: _getButtonStyle()
    );
  }
}

