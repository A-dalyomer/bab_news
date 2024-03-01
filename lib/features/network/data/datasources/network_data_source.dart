import 'package:bab_news/features/network/data/exception_handle/global_api_errors_handler.dart';
import 'package:dio/dio.dart';

import '../../../../core/datasource/general_datasource.dart';

class NetworkDataSource extends GeneralApiDataSource {
  final Dio _dio = Dio();

  @override
  Future<Map<String, dynamic>?> getRequest({
    required String apiPath,
    Map<String, dynamic>? extraHeaders,
    Function? onException,
    String? queryParameters,
  }) async {
    Map<String, dynamic> requestHeaders = {};

    if (extraHeaders != null) {
      requestHeaders.addAll(extraHeaders);
    }
    try {
      Response response = await _dio.get(
        apiPath + (queryParameters ?? ''),
        options: Options(
          headers: requestHeaders,
        ),
      );
      return response.data;
    } catch (exception) {
      if (onException != null) {
        onException.call(exception);
      } else {
        handleGlobalApiErrors((exception as DioException).response?.statusCode);
      }
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> postRequest({
    required String apiPath,
    Function? onException,
    Map<String, dynamic>? extraHeaders,
    Map<String, dynamic>? requestBody,
    Function? onSendProgress,
    FormData? formData,
  }) async {
    Map<String, dynamic> requestHeaders = {};

    if (extraHeaders != null) {
      requestHeaders.addAll(extraHeaders);
    }
    try {
      Response response = await _dio.post(
        apiPath,
        options: Options(
          headers: requestHeaders,
        ),
        data: formData ?? requestBody,
        onSendProgress: (count, total) => onSendProgress?.call(count, total),
      );
      return response.data;
    } catch (exception) {
      if (onException != null) {
        onException.call(exception);
      } else {
        handleGlobalApiErrors((exception as DioException).response?.statusCode);
      }
      return null;
    }
  }
}
