import 'package:bab_news/core/di/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'features/top_stories/presentation/ui/screen/stories_screen.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  await DependencyInjector.init(getIt);
  runApp(const ProviderScope(child: NewsApp()));
}

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
