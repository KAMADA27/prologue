import 'package:flutter/material.dart';

import 'package:prologue/constants/colors_sb.dart';

class IconButtonSB extends StatelessWidget {
  final String? text;
  final IconData icon;
  final Function onPressed;

  const IconButtonSB({
    Key? key,
    this.text,
    required this.icon,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(), 
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: ColorsSB.bodyColor,
          ),
          if (text != null) Text(
            text!,
            style: TextStyle(
              color: ColorsSB.bodyColor
            ),
          )
        ],
      ),
    );
  }
}