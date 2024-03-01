import 'package:flutter/foundation.dart';

void runtimeErrorHandler(dynamic runtimeError) {
  if (kDebugMode) {
    print(runtimeError);
    print(StackTrace.current);
  }
}
