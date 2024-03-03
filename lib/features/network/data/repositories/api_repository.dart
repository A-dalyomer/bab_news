import 'package:bab_news/features/network/data/datasources/network_data_source.dart';
import 'package:dio/dio.dart';

import '../../domain/repositories/api_repository.dart';

/// API requests implementation for the abstract [ApiRequestsRepository]
class ApiRequestsRepositoryImp extends ApiRequestsRepository {
  ApiRequestsRepositoryImp(this.dataSource);
  final NetworkDataSource dataSource;

  @override
  Future<Map<String, dynamic>?> postRequest({
    required String apiPath,
    Function? onException,
    Map<String, dynamic>? extraHeaders,
    Map<String, dynamic>? requestBody,
    Function? onSendProgress,
    FormData? formData,
  }) async =>
      await dataSource.postRequest(
        apiPath: apiPath,
        onException: onException,
        extraHeaders: extraHeaders,
        requestBody: requestBody,
        onSendProgress: onSendProgress,
        formData: formData,
      );

  @override
  Future<Map<String, dynamic>?> getRequest({
    required String apiPath,
    Function? onException,
    Map<String, dynamic>? extraHeaders,
    String? queryParameters,
  }) async =>
      await dataSource.getRequest(
        apiPath: apiPath,
        onException: onException,
        extraHeaders: extraHeaders,
        queryParameters: queryParameters,
      );
}
