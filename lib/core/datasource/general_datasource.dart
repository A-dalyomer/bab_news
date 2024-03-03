/// A class to be extended by the API data sources and use same functionality
abstract class GeneralApiDataSource {
  Future<Map<String, dynamic>?> getRequest({
    required String apiPath,
    Map<String, dynamic>? extraHeaders,
    Function? onException,
  });
  Future<Map<String, dynamic>?> postRequest({
    required String apiPath,
    Function? onException,
    Map<String, dynamic>? extraHeaders,
    Map<String, dynamic>? requestBody,
    Function? onSendProgress,
  });
}
