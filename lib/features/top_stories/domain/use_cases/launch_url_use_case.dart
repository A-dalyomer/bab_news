import 'package:bab_news/core/use_case/use_case.dart';
import 'package:bab_news/core/utils/launch_url.dart';
import 'package:flutter/foundation.dart';

/// Use case for launching story URL
class LaunchUrlUseCase extends UseCase<void, String> {
  @override
  void call(String params) {
    if (kDebugMode) {
      print("launching url $params");
    }
    launchExternalUrl(params);
  }
}
