import 'package:flutter/material.dart';

class ScreenSize {
  static convertWidth(double requiredWidth, context) {
    return MediaQuery.of(context).size.width / (375 / requiredWidth);
  }

  static convertHeight(double requiredWidth, context) {
    return MediaQuery.of(context).size.height / (667 / requiredWidth);
  }
}
