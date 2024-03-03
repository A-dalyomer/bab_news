import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/network/data/constants/const_api_links.dart';
import 'package:bab_news/features/top_stories/domain/repositories/stories_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../network/data/datasources/network_data_source_test.mocks.dart';
import '../../domain/entities/story_entity.dart';
import 'stories_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<StoriesRepository>()])
void main() async {
  // arrange
  final GetIt getIt = GetIt.instance;
  await DependencyInjector.init(getIt);
  final apiDataSource = MockNetworkDataSource();
  final storiesRepository = MockStoriesRepository();

  group('test getStories from repository', () {
    test('returns List<StoryEntity> on correct response', () async {
      // act
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

      // assert
      expect(
        await storiesRepository.getStories(StorySection.home),
        isA<List<StoryEntity>?>(),
      );
    });

    test('returns null on malformed response', () async {
      // act
      when(
        apiDataSource.getRequest(
          apiPath: ConstantApiLinks.topStories(StorySection.home),
          extraHeaders: {"Accept": 'application/json'},
        ),
      ).thenAnswer((_) async => {"results": ""});

      // assert
      expect(
        await storiesRepository.getStories(StorySection.home),
        isA<void>(),
      );
    });
  });
}
