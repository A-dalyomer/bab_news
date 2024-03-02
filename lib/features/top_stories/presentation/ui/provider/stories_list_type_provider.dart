import 'package:bab_news/core/utils/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
