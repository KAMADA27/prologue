import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:prologue/buttons/buttons_stories.dart';
import 'package:prologue/forms/inputs/input_stories.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Storybook(
    children: [
      ...ButtonStories().buttonStoriesList,
      ...InputStories().inputStoriesList
    ],
  );
}
