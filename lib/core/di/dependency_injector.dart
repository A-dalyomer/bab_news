import '../../features/network/presentation/di/register_network_bindings.dart';
import '../../features/top_stories/presentation/di/register_stories_bindings.dart';

class DependencyInjector {
  static Future<void> init() async {
    await registererNetworkBindings();
    await registererStoriesBindings();
  }
}
