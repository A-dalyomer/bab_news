import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/network/data/constants/const_api_links.dart';
import 'package:bab_news/features/network/data/datasources/network_data_source.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NetworkDataSource>()])
void main() async {
  ///arrange
  final dataSource = MockNetworkDataSource();

  group('getRequest', () {
    test('returns an map when completes successfully', () async {
      ///act
      when(
        dataSource.getRequest(
          apiPath: ConstantApiLinks.topStories(StorySection.home),
          extraHeaders: {"Accept": 'application/json'},
        ),
      ).thenAnswer((_) async => {
            "data": [],
            "code": 200,
            "message": true,
          });

      ///assert
      expect(
          await dataSource.getRequest(
            apiPath: ConstantApiLinks.topStories(StorySection.home),
            extraHeaders: {"Accept": 'application/json'},
          ),
          isA<Map<String, dynamic>>());
    });

    test('returns null when completes with error', () async {
      ///act
      when(
        dataSource.getRequest(
          apiPath: ConstantApiLinks.topStories(StorySection.home),
          extraHeaders: {"Accept": 'application/json'},
          queryParameters: "foo",
        ),
      ).thenAnswer((_) async => null);

      ///assert
      expect(
          await dataSource.getRequest(
            apiPath: ConstantApiLinks.topStories(StorySection.home),
            extraHeaders: {"Accept": 'application/json'},
            queryParameters: "foo",
          ),
          isA<void>());
    });
  });
}
