import 'package:flutter/material.dart';

/// Useful extensions for getting percentage sizes depending on screen
/// width or height
extension Dim on BuildContext {
  double constWidth(double num) {
    return MediaQuery.of(this).size.width * num;
  }

  double constHeight(double num) {
    return MediaQuery.of(this).size.height * num;
  }
}
