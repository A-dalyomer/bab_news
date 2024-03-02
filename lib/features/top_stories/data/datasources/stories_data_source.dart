import 'dart:async';

import 'package:bab_news/core/constants/api_keys.dart';
import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/core/utils/error_handlers/runtime_error_handler.dart';
import 'package:bab_news/features/network/data/constants/const_api_links.dart';
import 'package:bab_news/features/top_stories/data/models/srory_model.dart';

import '../../../network/domain/repositories/api_repository.dart';
import '../../domain/entities/story_entity.dart';

class StoriesDataSource {
  StoriesDataSource(this._apiRequestsRepository);
  final ApiRequestsRepository _apiRequestsRepository;

  Future<List<StoryEntity>?> getStories(StorySection section) async {
    final Map<String, dynamic>? response =
        await _apiRequestsRepository.getRequest(
      apiPath: ConstantApiLinks.topStories(section),
      queryParameters: '?api-key=${ApiKeys.nyTimesApiKey}',
    );

    if (response == null) return null;
    try {
      final List results = response['results'];
      return results.map((e) => StoryModel.fromJson(e)).toList();
    } catch (runtimeError) {
      runtimeErrorHandler(runtimeError);
      return null;
    }
  }
}
