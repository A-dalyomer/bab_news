import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/network/data/constants/const_api_links.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:bab_news/features/top_stories/domain/use_cases/get_stories_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../network/data/datasources/network_data_source_test.mocks.dart';
import '../repositories/stories_repository_test.mocks.dart';
import 'get_stories_use_case.mocks.dart';

@GenerateNiceMocks([MockSpec<GetStoriesUseCase>()])
void main() async {
  ///arrange
  final apiDataSource = MockNetworkDataSource();
  final storiesUseCase = MockGetStoriesUseCase();

  group('test GetStoriesUseCase', () {
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
      storiesUseCase.setStorySection(StorySection.home);

      ///assert
      expect(
        await storiesUseCase(MockStoriesRepository()),
        isA<List<StoryEntity>?>(),
      );
    });
  });
}
