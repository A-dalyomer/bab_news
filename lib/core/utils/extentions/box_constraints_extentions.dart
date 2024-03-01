import 'package:flutter/material.dart';

extension SmallestWidth on BoxConstraints {
  double orientedWidth() {
    if (maxWidth < maxHeight) {
      return maxWidth;
    } else {
      return maxHeight;
    }
  }

  double orientedHeight(BuildContext context) {
    if (maxWidth < maxHeight) {
      return maxHeight.clamp(0, MediaQuery.of(context).size.height);
    } else {
      return maxWidth.clamp(0, MediaQuery.of(context).size.width);
    }
  }
}
