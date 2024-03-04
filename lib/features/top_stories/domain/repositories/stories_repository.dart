import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';

/// An abstract stories repository defining main features
abstract class StoriesRepository {
  Future<List<StoryEntity>?> getStories(StorySection section);
}
