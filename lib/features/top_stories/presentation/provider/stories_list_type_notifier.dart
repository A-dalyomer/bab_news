import 'package:bab_news/core/utils/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier for the current stories view type
/// either a list or grid type
class StoriesListTypeNotifier extends Notifier<StoriesViewType> {
  @override
  StoriesViewType build() => StoriesViewType.list;

  void updateState(StoriesViewType viewType) {
    state = viewType;
  }
}

final storiesListTypeNotifier =
    NotifierProvider<StoriesListTypeNotifier, StoriesViewType>(
  StoriesListTypeNotifier.new,
);
