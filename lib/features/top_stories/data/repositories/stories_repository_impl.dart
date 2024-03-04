import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:bab_news/features/top_stories/domain/repositories/stories_repository.dart';
import 'package:flutter/foundation.dart';

import '../datasources/stories_data_source.dart';

/// Stories repository implementation
/// with the overridden implemented functionality
class StoriesRepositoryImpl extends StoriesRepository {
  StoriesRepositoryImpl(this.dataSource);
  final StoriesDataSource dataSource;
  @override
  Future<List<StoryEntity>?> getStories(StorySection section) async {
    if (kDebugMode) {
      print("Getting stories");
    }
    return await dataSource.getStories(section);
  }
}
