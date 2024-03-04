import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'features/top_stories/presentation/ui/screen/stories_screen.dart';

/// App's main instance for the Get_it dependency injector
final GetIt getIt = GetIt.instance;

/// App main entry point
void main() async {
  /// inject the needed dependencies on starting
  await DependencyInjector.init(getIt);

  /// run the flutter app with the initial widget
  runApp(const ProviderScope(child: NewsApp()));
}

/// Root app widget
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const StoriesScreen(),
    );
  }
}
