import 'package:bab_news/core/utils/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoriesSectionNotifier extends Notifier<StorySection> {
  @override
  StorySection build() => StorySection.home;

  void updateState(StorySection newSection) {
    state = newSection;
  }
}

final storiesSectionNotifier =
    NotifierProvider<StoriesSectionNotifier, StorySection>(
  StoriesSectionNotifier.new,
);
