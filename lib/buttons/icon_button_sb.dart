import 'package:flutter/material.dart';

class IconButtonSB extends StatelessWidget {
  final String? text;
  final IconData icon;
  final Function callback;

  const IconButtonSB({
    Key? key,
    this.text,
    required this.icon,
    required this.callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => callback(), 
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: const Color(0xFF4F4E50),
          ),
          if (text != null) Text(
            text!,
            style: const TextStyle(
              color: Color(0xFF4F4E50)
            ),
          )
        ],
      ),
    );
  }
}