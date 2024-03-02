import 'package:bab_news/core/widget/app_empty_data_widget.dart';
import 'package:bab_news/core/widget/app_loading_error_widget.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_app_bar.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widget/app_circle_indicator.dart';
import '../../../../../main.dart';
import '../../../domain/entities/story_entity.dart';
import '../provider/stories_provider.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  final AutoDisposeFutureProvider<List<StoryEntity>?> provider =
      FutureProvider.autoDispose(
    (ref) => getIt<StoriesProvider>().getStories(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoriesAppbar(),
      body: Consumer(
        builder: (context, ref, child) {
          final providerListener = ref.watch(provider);

          if (providerListener.isLoading) {
            return const Center(
              child: AppCircleIndicator(),
            );
          }

          switch (providerListener.value) {
            case null:
              return AppLoadingErrorWidget(
                retry: () => ref.refresh(provider),
              );
            case []:
              return const AppEmptyDataWidget();
            default:
              return StoriesList(storiesList: providerListener.value!);
          }
        },
      ),
    );
  }
}
