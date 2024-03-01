import 'package:bab_news/core/use_case/use_case.dart';
import 'package:bab_news/core/utils/launch_url.dart';

class LaunchUrlUseCase extends UseCase<void, String> {
  @override
  void call(String params) {
    launchExternalUrl(params);
  }
}
