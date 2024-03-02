import 'package:flutter_riverpod/flutter_riverpod.dart';

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
