import 'package:flutter/material.dart';

class AppCircleIndicator extends StatefulWidget {
  const AppCircleIndicator({super.key});

  @override
  State<AppCircleIndicator> createState() => _AppCircleIndicatorState();
}

class _AppCircleIndicatorState extends State<AppCircleIndicator> {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
