import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_data_provider.dart';
import 'package:bab_news/features/top_stories/presentation/ui/screen/story_details_screen.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/read_more_button.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() async {
  ///Arrange group
  final GetIt getIt = GetIt.instance;
  await DependencyInjector.init(getIt);

  Future<void> buildWidgetWithProvider(
    WidgetTester tester,
    StoryEntity testState,
  ) async {
    ///Arrange
    final providerOverrides = [
      storiesDataProvider.overrideWith((ref) => [testState])
    ];

    ///Act
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: providerOverrides,
          child: StoryDetailsScreen(story: testState),
        ),
      ),
    );
  }

  group("Test stories details screen", () {
    testWidgets('Build all widgets', (tester) async {
      ///Arrange
      final StoryEntity testStory = StoryEntity(
        section: "section",
        images: const [],
        title: "title",
        abstractDescription: "abstractDescription",
        url: "url",
        publishedDate: DateTime.now(),
        author: "author",
      );

      ///Act
      await buildWidgetWithProvider(tester, testStory);

      ///Assert
      expect(find.byType(StoriesCarousel), findsOneWidget);
      expect(find.text(testStory.title), findsOneWidget);
      expect(find.text(testStory.abstractDescription), findsOneWidget);
      expect(find.text(testStory.author), findsOneWidget);
      expect(find.byType(ReadMoreButton), findsOneWidget);
    });
    testWidgets('Tap read more button', (tester) async {
      ///Arrange
      final StoryEntity testStory = StoryEntity(
        section: "section",
        images: const [],
        title: "title",
        abstractDescription: "abstractDescription",
        url: "url",
        publishedDate: DateTime.now(),
        author: "author",
      );

      ///Act
      await buildWidgetWithProvider(tester, testStory);

      ///Assert
      buttonTap() async => await tester.tap(find.byType(ReadMoreButton));
      expect(buttonTap, prints("launching url ${testStory.url}\n"));
    });
  });
}
