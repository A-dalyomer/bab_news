import 'package:bab_news/core/use_case/use_case.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:bab_news/features/top_stories/domain/repositories/stories_repository.dart';

class GetStoriesUseCase
    extends UseCase<Future<List<StoryEntity>?>, StoriesRepository> {
  GetStoriesUseCase(this.storiesRepository);
  final StoriesRepository storiesRepository;

  @override
  Future<List<StoryEntity>?> call(StoriesRepository params) async {
    return await storiesRepository.getStories();
  }
}
