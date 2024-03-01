class ConstantApiLinks {
  static const String domain = 'https://api.nytimes.com/svc';
  static const _apiVersion = 2;

  static const String topStories = '$domain/topstories/v$_apiVersion/home.json';
}
