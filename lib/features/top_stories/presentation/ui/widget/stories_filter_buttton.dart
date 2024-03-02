import 'package:bab_news/core/utils/extentions/build_context_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/enums.dart';
import '../provider/stories_state_controller.dart';

class StoriesFilterButton extends StatelessWidget {
  const StoriesFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final providerListener = ref.watch(storiesStateController);

        return PopupMenuButton<StorySection>(
          initialValue: providerListener.storySection,
          onSelected: (StorySection item) =>
              providerListener.changeStorySection(item),
          tooltip: "Select story section to show relevant data",
          itemBuilder: (BuildContext context) => <PopupMenuEntry<StorySection>>[
            for (var element in StorySection.values)
              PopupMenuItem<StorySection>(
                value: element,
                child: Text(element.name),
              ),
          ],
          constraints: BoxConstraints(
            maxHeight: context.constHeight(0.6),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.filter_alt, size: 20),
                Text('Filter'),
              ],
            ),
          ),
        );
      },
    );
  }
}
