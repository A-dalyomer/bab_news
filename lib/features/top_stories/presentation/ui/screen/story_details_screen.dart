import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/author_name_widget.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/read_more_button.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/stories_state_controller.dart';

class StoryDetailsScreen extends StatelessWidget {
  const StoryDetailsScreen({super.key, required this.story});
  final StoryEntity story;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(story.section)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StoriesCarousel(
              height: MediaQuery.of(context).size.height * 0.4,
              images: story.images,
            ),
            Text(
              story.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            Hero(
              tag: story.abstractDescription,
              child: Text(
                story.abstractDescription,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: AuthorName(name: story.author),
            ),
            if (story.url.toString().isNotEmpty)
              Consumer(
                builder: (context, ref, child) {
                  final providerListener = ref.read(storiesStateController);

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ReadMoreButton(
                      onTap: () => providerListener.launchStoryUrl(story.url),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
