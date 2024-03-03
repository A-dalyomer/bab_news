// ignore_for_file: avoid_print

import 'package:bab_news/features/network/data/exception_handle/global_api_errors_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  /// test [handleGlobalApiErrors]
  group('test global Api errors handler', () {
    test('prints the correct error on a handled status code', () async {
      ///Arrange
      int statusCode = 404;

      ///Act
      handler() => handleGlobalApiErrors(statusCode);

      ///assert
      expect(
        handler,
        prints("API error with status code $statusCode\n"
            'Global status code: $statusCode , check the api link path\n'),
      );
    });

    test('prints the correct error on non handled status code', () async {
      ///Arrange
      int statusCode = 500;

      ///Act
      handler() => handleGlobalApiErrors(statusCode);

      ///assert
      expect(
        handler,
        prints("API error with status code $statusCode\n"
            'Global status code: $statusCode has no handlers\n'),
      );
    });
  });
}
