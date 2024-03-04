import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier for the search word that triggers filtering the stories in list
class StoriesSearchNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateState(String searchWord) {
    state = searchWord;
  }
}

final storiesSearchNotifier = NotifierProvider<StoriesSearchNotifier, String>(
  StoriesSearchNotifier.new,
);
