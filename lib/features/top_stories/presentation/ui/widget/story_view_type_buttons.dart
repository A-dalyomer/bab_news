import 'package:bab_news/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widget/type_icon.dart';
import '../provider/stories_list_type_notifier.dart';

class StoryViewTypeButton extends StatelessWidget {
  const StoryViewTypeButton({super.key});

  void _updateState(WidgetRef ref, StoriesViewType newType) {
    ref.read(storiesListTypeNotifier.notifier).updateState(newType);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final StoriesViewType selectedType = ref.read(storiesListTypeNotifier);
        return Row(
          children: [
            TypeButton(
              icon: Icons.list,
              isSelected: selectedType == StoriesViewType.list,
              onTap: () => _updateState(ref, StoriesViewType.list),
            ),
            const SizedBox(width: 10),
            TypeButton(
              icon: Icons.grid_view_rounded,
              isSelected: selectedType == StoriesViewType.grid,
              onTap: () => _updateState(ref, StoriesViewType.grid),
            ),
          ],
        );
      },
    );
  }
}
