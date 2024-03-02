import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/stories_state_controller.dart';

class StoriesSearchField extends StatelessWidget {
  const StoriesSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final providerListener = ref.watch(storiesStateController);

        return TextField(
          onChanged: (newWord) => providerListener.setSearchWord(newWord),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, size: 20),
            hintText: "search",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}
