import 'package:flutter/material.dart';

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
