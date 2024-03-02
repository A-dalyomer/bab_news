import 'package:bab_news/core/widget/app_empty_data_widget.dart';
import 'package:bab_news/core/widget/app_loading_error_widget.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_app_bar.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widget/app_circle_indicator.dart';
import '../provider/stories_data_provider.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoriesAppbar(),
      body: Consumer(
        builder: (context, ref, child) {
          final providerListener = ref.watch(storiesDataProvider);

          if (providerListener.isLoading) {
            return const Center(
              child: AppCircleIndicator(),
            );
          }

          switch (providerListener.value) {
            case null:
              return AppLoadingErrorWidget(
                retry: () => ref.refresh(storiesDataProvider),
              );
            case []:
              return const AppEmptyDataWidget();
            default:
              return RefreshIndicator(
                onRefresh: () async => ref.refresh(storiesDataProvider),
                child: StoriesList(storiesList: providerListener.value!),
              );
          }
        },
      ),
    );
  }
}
