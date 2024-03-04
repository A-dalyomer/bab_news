import 'package:bab_news/core/constants/const_rive_assets.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

/// The APP's default loading indicator widget
class AppCircleIndicator extends StatefulWidget {
  const AppCircleIndicator({super.key});

  @override
  State<AppCircleIndicator> createState() => _AppCircleIndicatorState();
}

class _AppCircleIndicatorState extends State<AppCircleIndicator> {
  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(RiveAssets.loadingClock);
  }
}
