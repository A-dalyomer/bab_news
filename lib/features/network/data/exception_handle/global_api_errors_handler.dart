import 'package:flutter/foundation.dart';

///
void handleGlobalApiErrors(int? statusCode) {
  if (kDebugMode) {
    print("API error with status code $statusCode");
  }
  switch (statusCode) {
    case 404:
      if (kDebugMode) {
        print("Global status code: $statusCode , check the api link path");
      }

      /// implement not found use case

      break;
    default:
      if (kDebugMode) {
        print("Global status code: $statusCode has no handlers");
      }
  }
}
