import 'package:bab_news/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/stories_state_controller.dart';

class StoryViewTypeButton extends StatelessWidget {
  const StoryViewTypeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final providerListener = ref.watch(storiesStateController);

        return Row(
          children: [
            TypeButton(
              icon: Icons.list,
              onTap: () => providerListener.changeViewType(
                StoriesViewType.list,
              ),
            ),
            const SizedBox(width: 10),
            TypeButton(
              icon: Icons.grid_view_rounded,
              onTap: () => providerListener.changeViewType(
                StoriesViewType.grid,
              ),
            ),
          ],
        );
      },
    );
  }
}

class TypeButton extends StatelessWidget {
  const TypeButton({required this.onTap, required this.icon, super.key});
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(icon),
      ),
    );
  }
}
