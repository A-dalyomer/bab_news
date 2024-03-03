import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_list_type_notifier.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/story_view_type_buttons.dart';
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
          child: Material(child: StoryViewTypeButton()),
        ),
      ),
    );
  }

  group("Test stories list view type buttons", () {
    testWidgets('test tap', (tester) async {
      // Arrange
      // Act
      await buildWidgetWithProvider(tester);
      final listButton = find.byKey(const ValueKey(StoriesViewType.list));
      final gridButton = find.byKey(const ValueKey(StoriesViewType.grid));

      final stateContainer =
          ProviderScope.containerOf(tester.element(listButton));

      await tester.tap(listButton);
      await tester.pumpAndSettle();

      // Assert
      expect(
        stateContainer.read(storiesListTypeNotifier.notifier).state,
        equals(StoriesViewType.list),
      );

      // Act
      await tester.tap(gridButton);
      await tester.pumpAndSettle();

      // Assert
      expect(
        stateContainer.read(storiesListTypeNotifier.notifier).state,
        equals(StoriesViewType.grid),
      );
    });
  });
}
