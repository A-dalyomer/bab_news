import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:bab_news/features/top_stories/domain/use_cases/launch_url_use_case.dart';
import 'package:bab_news/features/top_stories/domain/use_cases/navigate_details_use_case.dart';
import 'package:bab_news/features/top_stories/presentation/provider/stories_data_provider.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() async {
  group('test network dependency injector', () {
    test('test that [ApiRequestsRepositoryImp] singleton is registered',
        () async {
      ///Arrange
      final GetIt getIt = GetIt.instance;

      ///Act
      await DependencyInjector.init(getIt);

      ///assert
      expect(getIt<StoriesDataProvider>(), isA<StoriesDataProvider>());
      expect(getIt<NavigateDetailsUseCase>(), isA<NavigateDetailsUseCase>());
      expect(getIt<LaunchUrlUseCase>(), isA<LaunchUrlUseCase>());
    });
  });
}
