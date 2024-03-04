import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_section_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../main.dart';
import '../../domain/entities/story_entity.dart';
import '../../domain/use_cases/get_stories_use_case.dart';

/// Stories data provider that handles calling the API request for stories
/// and returns back the loaded stories list object
/// Utilizes the riverpod feature for internally handling the loading status
class StoriesDataProvider {
  StoriesDataProvider(this._getStoriesUseCase);
  final GetStoriesUseCase _getStoriesUseCase;

  Future<List<StoryEntity>?> getStories(StorySection section) async {
    if (kDebugMode) {
      print("calling api");
    }
    _getStoriesUseCase.setStorySection(section);
    List<StoryEntity>? stories = await _getStoriesUseCase(getIt());
    return stories;
  }
}

final AutoDisposeFutureProvider<List<StoryEntity>?> storiesDataProvider =
    FutureProvider.autoDispose(
  (ref) {
    final storiesState = ref.watch(storiesSectionNotifier);
    return getIt<StoriesDataProvider>().getStories(storiesState);
  },
);
