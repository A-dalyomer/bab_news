import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../../../utils/provider_container.dart';

void main() async {
  final GetIt getIt = GetIt.instance;
  await DependencyInjector.init(getIt);
  group('test StoriesDataProvider', () {
    test('test provider returns null', () async {
      // Arrange
      late final ProviderContainer container;
      // Act
      container = createContainer(
        overrides: [storiesDataProvider.overrideWith((ref) => null)],
      );

      // assert
      expect(
        container.read(storiesDataProvider),
        isA<void>(),
      );
    });
  });
}
