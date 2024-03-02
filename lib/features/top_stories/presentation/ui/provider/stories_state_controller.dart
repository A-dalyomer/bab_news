import 'package:bab_news/core/dto/navigator_data.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:bab_news/features/top_stories/domain/use_cases/launch_url_use_case.dart';
import 'package:bab_news/features/top_stories/domain/use_cases/navigate_details_use_case.dart';
import 'package:bab_news/features/top_stories/presentation/ui/screen/story_details_screen.dart';
import 'package:bab_news/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoriesStateController extends ChangeNotifier {
  StoriesStateController(
    this._navigateDetailsUseCase,
    this._launchUrlUseCase,
  );
  final NavigateDetailsUseCase _navigateDetailsUseCase;
  final LaunchUrlUseCase _launchUrlUseCase;

  void navigateStoryDetails(BuildContext context, StoryEntity story) {
    if (story.title.isNotEmpty && story.abstractDescription.isNotEmpty) {
      _navigateDetailsUseCase(NavigatorData(
        context: context,
        routeTarget: StoryDetailsScreen(story: story),
      ));
    }
  }

  void launchStoryUrl(String url) => _launchUrlUseCase(url);
}

final storiesStateController =
    ChangeNotifierProvider<StoriesStateController>((ref) {
  return StoriesStateController(getIt(), getIt());
});
