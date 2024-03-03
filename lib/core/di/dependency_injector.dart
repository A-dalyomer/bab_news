import 'package:get_it/get_it.dart';

import '../../features/network/presentation/di/register_network_bindings.dart';
import '../../features/top_stories/presentation/di/register_stories_bindings.dart';

/// Core features dependency injector
class DependencyInjector {
  static Future<void> init(GetIt getIt) async {
    await registererNetworkBindings(getIt);
    await registererStoriesBindings(getIt);
  }
}
