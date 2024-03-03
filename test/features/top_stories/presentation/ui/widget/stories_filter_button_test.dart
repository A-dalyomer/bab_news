import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_data_provider.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_section_notifier.dart';
import 'package:bab_news/features/top_stories/presentation/ui/screen/stories_screen.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_filter_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() async {
  // Arrange
  final GetIt getIt = GetIt.instance;
  await DependencyInjector.init(getIt);
  StorySection currentStateSection = StorySection.home;

  Future<void> buildWidgetWithProvider(
    WidgetTester tester,
    List<StoryEntity>? testState,
  ) async {
    // Arrange
    final providerOverrides = [
      storiesDataProvider.overrideWith((ref) {
        final section = ref.watch(storiesSectionNotifier);
        if (kDebugMode) {
          print("loading section: $section");
        }
        currentStateSection = section;
        return testState;
      })
    ];

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: providerOverrides,
          child: const StoriesScreen(),
        ),
      ),
    );
  }

  group("Test stories screen filter button", () {
    testWidgets('change selected filter test', (tester) async {
      // Arrange
      const StorySection testSection = StorySection.arts;
      final filterButton = find.byType(StoriesFilterButton);
      // Act
      await buildWidgetWithProvider(tester, null);

      // Assert
      expect(filterButton, findsOneWidget);

      // Act
      await tester.tap(filterButton);
      await tester.pumpAndSettle();

      await tester.tap(find.text(testSection.name));
      await tester.pumpAndSettle();

      // Assert

      expect(currentStateSection, equals(testSection));
    });
  });
}
