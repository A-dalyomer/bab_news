import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/network/data/constants/const_api_links.dart';
import 'package:bab_news/features/top_stories/data/datasources/stories_data_source.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../network/data/datasources/network_data_source_test.mocks.dart';
import 'stories_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<StoriesDataSource>()])
void main() async {
  ///arrange
  final apiDataSource = MockNetworkDataSource();
  final storiesDataSource = MockStoriesDataSource();

  group('test getStories', () {
    test('returns List<StoryEntity> on correct response', () async {
      ///act
      when(
        apiDataSource.getRequest(
          apiPath: ConstantApiLinks.topStories(StorySection.home),
          extraHeaders: {"Accept": 'application/json'},
        ),
      ).thenAnswer((_) async => {
            "results": [
              StoryEntity(
                section: 'home',
                images: const [],
                title: 'title',
                abstractDescription: 'abstractDescription',
                url: 'url',
                publishedDate: DateTime.now(),
                author: 'author',
              ),
            ],
          });

      ///assert
      expect(
        await storiesDataSource.getStories(StorySection.home),
        isA<List<StoryEntity>?>(),
      );
    });
    test('returns null on malformed response', () async {
      ///act
      when(
        apiDataSource.getRequest(
          apiPath: ConstantApiLinks.topStories(StorySection.home),
          extraHeaders: {"Accept": 'application/json'},
        ),
      ).thenAnswer((_) async => {"results": ""});

      ///assert
      expect(
        await storiesDataSource.getStories(StorySection.home),
        isA<void>(),
      );
    });
  });
}
