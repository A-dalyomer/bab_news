import 'package:flutter/cupertino.dart';

/// DTO class for holding the navigation data to the navigator use case
class NavigatorData<T> {
  NavigatorData({
    required this.context,
    required this.routeTarget,
  });
  final BuildContext context;
  final Widget routeTarget;
}
