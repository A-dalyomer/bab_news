import 'package:flutter/material.dart';

/// Used in cases when no data to be viewed
class AppEmptyDataWidget extends StatelessWidget {
  const AppEmptyDataWidget({
    this.message = "No stories available",
    super.key,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
