import 'package:flutter/material.dart';

abstract class Validator {
  late final FocusNode? focusNode;
  late final TextInputType textInputType;
  late InputDecoration? inputDecoration = const InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always
  );

  String? validate({String? text, bool mandatory = false});
}