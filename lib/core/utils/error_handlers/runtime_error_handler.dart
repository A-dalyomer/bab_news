import 'package:flutter/foundation.dart';

/// Core runtime errors handler that is useful currently for printing errors
/// But its main goal to implement a runtime errors loggers
/// such as firebase or server implementations.
void runtimeErrorHandler(dynamic runtimeError) {
  if (kDebugMode) {
    print(runtimeError);
    print(StackTrace.current);
  }
}
