import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_data_provider.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_section_notifier.dart';
import 'package:bab_news/features/top_stories/presentation/ui/screen/stories_screen.dart';
import 'package:bab_news/features/top_stories/presentation/ui/screen/story_details_screen.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_filter_button.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/story_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() async {
  /// Arrange
  final GetIt getIt = GetIt.instance;
  await DependencyInjector.init(getIt);
  StorySection currentStateSection = StorySection.home;

  Future<void> buildWidgetWithProvider(
    WidgetTester tester,
    List<StoryEntity>? testState,
  ) async {
    /// Arrange
    final providerOverrides = [
      storiesDataProvider.overrideWith((ref) {
        final section = ref.watch(storiesSectionNotifier);
        if (kDebugMode) {
          print("mocking section: $section");
        }
        currentStateSection = section;
        return testState;
      })
    ];

    /// Act
    await tester.pumpWidget(
      ProviderScope(
        overrides: providerOverrides,
        child: const MaterialApp(
          home: StoriesScreen(),
        ),
      ),
    );
  }

  testWidgets('full top_stories feature integration test', (tester) async {
    /// Arrange
    const StorySection testSection = StorySection.arts;
    final filterButton = find.byType(StoriesFilterButton);

    /// Act
    await buildWidgetWithProvider(
      tester,
      [
        StoryEntity(
          section: "section",
          images: const [],
          title: "title",
          abstractDescription: "abstractDescription",
          url: "url",
          publishedDate: DateTime.now(),
          author: "author",
        )
      ],
    );

    /// Assert change section
    expect(filterButton, findsOneWidget);

    /// Act change section
    await tester.tap(filterButton);
    await tester.pumpAndSettle();

    await tester.tap(find.text(testSection.name));
    await tester.pumpAndSettle();

    /// Assert change section
    expect(currentStateSection, equals(testSection));

    /// Act search filter
    await tester.enterText(find.byType(TextField), "tested input");
    await tester.pumpAndSettle();

    /// Assert search filter
    expect(find.byType(StoryItem), findsNothing);

    /// Act search filter
    await tester.enterText(find.byType(TextField), "");
    await tester.pumpAndSettle();

    /// Assert search filter
    expect(find.byType(StoryItem), findsAtLeast(1));

    /// Arrange view type
    final linearListview = find.byKey(const ValueKey(1));
    final gridButton = find.byKey(const ValueKey(StoriesViewType.grid));
    final listButton = find.byKey(const ValueKey(StoriesViewType.list));

    /// Act view type
    await tester.tap(listButton);
    await tester.pumpAndSettle();

    /// Assert view type
    expect(linearListview, findsOne);

    /// Act view type
    await tester.tap(gridButton);
    await tester.pumpAndSettle();

    /// Assert view type
    expect(linearListview, findsNothing);

    /// Arrange
    final storyItem = find.byType(StoryItem).first;
    final storyDetailsScreen = find.byType(StoryDetailsScreen);

    /// Assert navigate details screen
    await tester.tap(storyItem);
    await tester.pumpAndSettle();

    expect(storyDetailsScreen, findsOne);
  });
}
