import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_search_notifier.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() async {
  // Arrange
  final GetIt getIt = GetIt.instance;
  await DependencyInjector.init(getIt);

  Future<void> buildWidgetWithProvider(
    WidgetTester tester,
  ) async {
    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: ProviderScope(
          child: Material(child: StoriesSearchField()),
        ),
      ),
    );
  }

  group("Test stories search field states", () {
    testWidgets('Enter search word and check notifier state test',
        (tester) async {
      // Arrange
      const String testWord = "hi,from tester";
      // Act
      await buildWidgetWithProvider(tester);
      final element = tester.element(find.byType(StoriesSearchField));
      final container = ProviderScope.containerOf(element);
      await tester.enterText(find.byType(TextField), testWord);

      // Assert
      expect(
        container.read(storiesSearchNotifier.notifier).state,
        equals(testWord),
      );
    });
  });
}
