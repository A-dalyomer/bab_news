import 'package:bab_news/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widget/type_icon.dart';
import '../../provider/stories_list_type_notifier.dart';

/// Buttons for managing the [storiesListTypeNotifier] state value
/// includes two [TypeButton] for changing the current list view type
/// utilizes the [StoriesViewType] to set the current status
class StoryViewTypeButton extends StatelessWidget {
  const StoryViewTypeButton({super.key});

  void _updateState(WidgetRef ref, StoriesViewType newType) {
    ref.read(storiesListTypeNotifier.notifier).updateState(newType);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final StoriesViewType selectedType = ref.watch(storiesListTypeNotifier);
        return Row(
          children: [
            TypeButton(
              icon: Icons.list,
              isSelected: selectedType == StoriesViewType.list,
              onTap: () => _updateState(ref, StoriesViewType.list),
              key: const ValueKey(StoriesViewType.list),
            ),
            const SizedBox(width: 10),
            TypeButton(
              icon: Icons.grid_view_rounded,
              isSelected: selectedType == StoriesViewType.grid,
              onTap: () => _updateState(ref, StoriesViewType.grid),
              key: const ValueKey(StoriesViewType.grid),
            ),
          ],
        );
      },
    );
  }
}
