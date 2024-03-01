import 'package:bab_news/core/use_case/use_case.dart';
import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/dto/navigator_data.dart';

class NavigateDetailsUseCase extends UseCase<void, NavigatorData<StoryEntity>> {
  @override
  void call(NavigatorData params) {
    Navigator.of(params.context).push(MaterialPageRoute(
      builder: (context) {
        return params.routeTarget;
      },
    ));
  }
}
