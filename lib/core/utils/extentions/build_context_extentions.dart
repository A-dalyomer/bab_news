import 'package:flutter/material.dart';

extension Dim on BuildContext {
  double constWidth(double num) {
    return MediaQuery.of(this).size.width * num;
  }

  double constHeight(double num) {
    return MediaQuery.of(this).size.height * num;
  }
}
