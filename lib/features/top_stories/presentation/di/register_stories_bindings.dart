import 'package:bab_news/features/top_stories/data/datasources/stories_data_source.dart';
import 'package:bab_news/features/top_stories/data/repositories/stories_repository_impl.dart';

import '../../../../main.dart';
import '../../domain/repositories/stories_repository.dart';
import '../../domain/use_cases/get_stories_use_case.dart';
import '../../domain/use_cases/launch_url_use_case.dart';
import '../../domain/use_cases/navigate_details_use_case.dart';
import '../ui/provider/stories_data_provider.dart';

Future<void> registererStoriesBindings() async {
  /// data provider bindings
  getIt.registerSingleton<StoriesDataSource>(StoriesDataSource(getIt()));
  getIt.registerSingleton<StoriesRepository>(StoriesRepositoryImpl(getIt()));
  getIt.registerSingleton<GetStoriesUseCase>(GetStoriesUseCase(getIt()));
  getIt.registerSingleton<StoriesDataProvider>(StoriesDataProvider(getIt()));

  /// state bindings
  getIt.registerSingleton<NavigateDetailsUseCase>(NavigateDetailsUseCase());
  getIt.registerSingleton<LaunchUrlUseCase>(LaunchUrlUseCase());
}
