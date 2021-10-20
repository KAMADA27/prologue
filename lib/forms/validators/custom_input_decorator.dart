import 'package:flutter/material.dart';

mixin CustomInputDecorator {
  InputDecoration? populate(
      {required String labelText, required String hintText}) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
    );
  }
}