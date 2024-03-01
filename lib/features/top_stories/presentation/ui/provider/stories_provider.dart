import 'package:flutter/foundation.dart';

import '../../../../../main.dart';
import '../../../domain/entities/story_entity.dart';
import '../../../domain/use_cases/get_stories_use_case.dart';

class StoriesProvider {
  StoriesProvider(this._getStoriesUseCase);
  final GetStoriesUseCase _getStoriesUseCase;

  Future<List<StoryEntity>?> getStories() async {
    if (kDebugMode) {
      print("calling api");
    }
    List<StoryEntity>? stories = await _getStoriesUseCase(getIt());
    return stories;
  }
}
