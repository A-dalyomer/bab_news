import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/stories_state_controller.dart';
import 'story_item.dart';

class StoriesList extends StatelessWidget {
  const StoriesList({required this.storiesList, super.key});
  final List<StoryEntity> storiesList;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final providerListener = ref.watch(storiesStateController);

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                providerListener.storiesViewType == StoriesViewType.grid
                    ? 2
                    : 1,
            mainAxisExtent:
                providerListener.storiesViewType == StoriesViewType.grid
                    ? 500
                    : 200,
          ),
          itemCount: storiesList.length,
          itemBuilder: (context, index) {
            final StoryEntity story = storiesList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: StoryItem(
                story: story,
                onTap: () => providerListener.navigateStoryDetails(
                  context,
                  story,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
