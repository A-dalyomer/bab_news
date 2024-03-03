import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_list_type_notifier.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_search_notifier.dart';
import 'package:bab_news/features/top_stories/presentation/ui/screen/story_details_screen.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/stories_list.dart';
import 'package:bab_news/features/top_stories/presentation/ui/widget/story_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class StoriesSearchNotifierMock extends Notifier<String>
    with Mock
    implements StoriesSearchNotifier {}

void main() async {
  ///Arrange
  final GetIt getIt = GetIt.instance;
  await DependencyInjector.init(getIt);

  final parentWidget = find.byType(StoriesList);
  final storyItemWidget = find.byType(StoryItem);
  final gridListview = find.byKey(const ValueKey(2));
  final linearListview = find.byKey(const ValueKey(1));

  Future<void> buildWidgetWithProvider(
    WidgetTester tester,
  ) async {
    ///Act
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Material(
            child: StoriesList(
              storiesList: [
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
            ),
          ),
        ),
      ),
    );
  }

  group("Test stories list", () {
    testWidgets('test change list view type state', (tester) async {
      ///Arrange
      ///Act
      await buildWidgetWithProvider(tester);
      final stateContainer =
          ProviderScope.containerOf(tester.element(parentWidget));
      final viewTypeNotifier =
          stateContainer.read(storiesListTypeNotifier.notifier);

      ///Act listview
      viewTypeNotifier.state = StoriesViewType.list;
      await tester.pumpAndSettle();

      ///Assert listview
      expect(linearListview, findsOne);

      ///Act gridview
      viewTypeNotifier.state = StoriesViewType.grid;
      await tester.pumpAndSettle();

      ///Assert gridview
      expect(gridListview, findsOne);
    });

    testWidgets('test change search state', (tester) async {
      ///Arrange
      ///Act
      await buildWidgetWithProvider(tester);

      expect(find.byType(StoriesList), findsOne);
      final stateContainer =
          ProviderScope.containerOf(tester.element(parentWidget));
      final searchNotifier =
          stateContainer.read(storiesSearchNotifier.notifier);

      ///Act empty search
      searchNotifier.state = "";
      await tester.pumpAndSettle();

      ///Assert empty search
      expect(storyItemWidget, findsAtLeast(1));

      ///Act empty search
      searchNotifier.state = "testing search";
      await tester.pumpAndSettle();

      ///Assert empty search
      expect(storyItemWidget, findsNothing);
    });

    testWidgets('test navigation to story details screen', (tester) async {
      ///Arrange
      final storyDetailsScreen = find.byType(StoryDetailsScreen);

      ///Act
      await buildWidgetWithProvider(tester);
      await tester.tap(storyItemWidget.first);
      await tester.pumpAndSettle();

      ///Assert
      expect(storyDetailsScreen, findsOne);
    });
  });
}
