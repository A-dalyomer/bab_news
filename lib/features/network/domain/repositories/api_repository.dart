import 'package:dio/dio.dart';

abstract class ApiRequestsRepository {
  Future<Map<String, dynamic>?> postRequest({
    required String apiPath,
    Function? onException,
    Map<String, dynamic>? extraHeaders,
    Map<String, dynamic>? requestBody,
    Function? onSendProgress,
    FormData? formData,
  });

  Future<Map<String, dynamic>?> getRequest({
    required String apiPath,
    Function? onException,
    Map<String, dynamic>? extraHeaders,
    String? queryParameters,
  });
}
