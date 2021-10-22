import 'package:flutter/material.dart';

import 'package:prologue/constants/colors_sb.dart';

import 'package:prologue/models/prop.dart';

class WidgetDetails extends StatelessWidget {
  final String description;
  final List<Prop> propList;
  final Widget preview;

  const WidgetDetails({
    required this.description,
    required this.propList,
    required this.preview,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  description,
                  style: theme.textTheme.bodyText1,
                ),
                const SizedBox(height: 20.0),
                const Title(title: 'Constructors'),
                const SizedBox(height: 10.0),
                for (var prop in propList) PropText(
                  type: prop.type,
                  name: prop.name,
                  required: prop.required,
                  description: prop.description
                ),
                const SizedBox(height: 15.0),
                const Title(title: 'Demonstração'),
                preview
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PropText extends StatelessWidget {
  final String type;
  final String name;
  final String description;
  final bool? required;

  const PropText({
    required this.type,
    required this.name,
    required this.description,
    this.required,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: theme.textTheme.bodyText1,
              children: <TextSpan>[
                if (required == true) TextSpan(
                  text: 'required ', 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorsSB.errorColor
                  )
                ),
                TextSpan(
                  text: type, 
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
                TextSpan(text: name) 
              ]
            )
          ),
          const SizedBox(height: 5.0),
          Text(description)
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;

  const Title({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: ColorsSB.primaryColor,
        fontWeight: FontWeight.bold
      ),
    );
  }
}