import 'package:flutter/material.dart';

class WidgetCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String routeName;

  const WidgetCard({
    Key? key, 
    required this.title,
    this.subtitle = '',
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _mediaQuery = MediaQuery.of(context);

    void _navigateToWidget() {
      Navigator.pushNamed(context, routeName);
    }

    return GestureDetector(
      onTap: _navigateToWidget,
      child: SizedBox(
        width: _mediaQuery.size.width * 0.90,
        height: 150,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: _theme.textTheme.headline6,
                ),
                Text(
                  subtitle!,
                  style: _theme.textTheme.subtitle1,
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}