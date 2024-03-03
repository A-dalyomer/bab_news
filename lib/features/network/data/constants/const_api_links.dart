import 'package:bab_news/core/utils/enums.dart';

/// API links manager for the project
class ConstantApiLinks {
  static const String domain = 'https://api.nytimes.com/svc';
  static const _apiVersion = 2;

  static String topStories(StorySection section) {
    return '$domain/topstories/v$_apiVersion/${section.name}.json';
  }
}
