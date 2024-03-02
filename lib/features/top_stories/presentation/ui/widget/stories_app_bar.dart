import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_filter_buttton.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_search_field.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/story_view_type_buttons.dart';
import 'package:flutter/material.dart';

class StoriesAppbar extends StatefulWidget implements PreferredSizeWidget {
  const StoriesAppbar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  State<StoriesAppbar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<StoriesAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const SizedBox(height: 50, child: StoriesSearchField()),
      actions: const [
        StoriesFilterButton(),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: StoryViewTypeButton(),
        ),
      ],
    );
  }
}
