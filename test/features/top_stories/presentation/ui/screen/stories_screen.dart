import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:bab_news/core/widget/app_empty_data_widget.dart';
import 'package:bab_news/core/widget/app_loading_error_widget.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_data_provider.dart';
import 'package:bab_news/features/top_stories/presentation/ui/screen/stories_screen.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_list.dart';
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
    List<StoryEntity>? testState,
  ) async {
    // Arrange
    final providerOverrides = [
      storiesDataProvider.overrideWith((ref) => testState)
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

  group("Test stories screen states", () {
    testWidgets('Loading error test', (tester) async {
      // Arrange
      // Act
      await buildWidgetWithProvider(tester, null);

      // Assert
      expect(find.byType(AppLoadingErrorWidget), findsOneWidget);
    });

    testWidgets('Empty response state', (tester) async {
      // Arrange
      // Act
      await buildWidgetWithProvider(tester, []);

      // Assert
      expect(find.byType(AppEmptyDataWidget), findsOneWidget);
    });

    testWidgets('Response with data state', (tester) async {
      // Act
      await buildWidgetWithProvider(tester, [
        StoryEntity(
          section: "section",
          images: const [],
          title: "title",
          abstractDescription: "abstractDescription",
          url: "url",
          publishedDate: DateTime.now(),
          author: "author",
        ),
      ]);

      // Assert
      expect(find.byType(StoriesList), findsOneWidget);
    });
  });
}
