import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/stories_list_type_notifier.dart';
import '../../provider/stories_search_notifier.dart';
import '../../provider/stories_state_controller.dart';
import 'story_item.dart';

class StoriesList extends StatelessWidget {
  const StoriesList({required this.storiesList, super.key});
  final List<StoryEntity> storiesList;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final searchWord = ref.watch(storiesSearchNotifier).toLowerCase();

        final List<StoryEntity> filteredStories = [];
        if (searchWord.isNotEmpty) {
          for (var element in storiesList) {
            if (element.title.toLowerCase().contains(searchWord) ||
                element.author.toLowerCase().contains(searchWord)) {
              filteredStories.add(element);
            }
          }
        } else {
          filteredStories.addAll(storiesList);
        }

        return Consumer(
          builder: (context, ref, child) {
            final providerListener = ref.watch(storiesStateController);
            final StoriesViewType viewType = ref.watch(storiesListTypeNotifier);

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: GridView.builder(
                key: ValueKey<int>(
                  viewType == StoriesViewType.grid ? 2 : 1,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: viewType == StoriesViewType.grid ? 2 : 1,
                  mainAxisExtent: viewType == StoriesViewType.grid ? 400 : 200,
                ),
                itemCount: filteredStories.length,
                itemBuilder: (context, index) {
                  final StoryEntity story = filteredStories[index];
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
              ),
            );
          },
        );
      },
    );
  }
}
