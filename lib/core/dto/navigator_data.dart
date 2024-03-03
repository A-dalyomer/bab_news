import 'package:flutter/cupertino.dart';

class NavigatorData<T> {
  NavigatorData({
    required this.context,
    required this.routeTarget,
  });
  final BuildContext context;
  final Widget routeTarget;
}
