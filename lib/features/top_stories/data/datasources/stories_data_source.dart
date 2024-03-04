import 'dart:async';

import 'package:bab_news/core/constants/api_keys.dart';
import 'package:bab_news/core/utils/enums.dart';
import 'package:bab_news/core/utils/error_handlers/runtime_error_handler.dart';
import 'package:bab_news/features/network/data/constants/const_api_links.dart';
import 'package:bab_news/features/top_stories/data/models/srory_model.dart';

import '../../../network/domain/repositories/api_repository.dart';
import '../../domain/entities/story_entity.dart';

/// Stories data source
class StoriesDataSource {
  StoriesDataSource(this._apiRequestsRepository);
  final ApiRequestsRepository _apiRequestsRepository;

  /// Calls top stories api from network feature by the provided [ApiRequestsRepository]
  Future<List<StoryEntity>?> getStories(StorySection section) async {
    final Map<String, dynamic>? response =
        await _apiRequestsRepository.getRequest(
      apiPath: ConstantApiLinks.topStories(section),
      queryParameters: '?api-key=${ApiKeys.nyTimesApiKey}',
    );

    /// return null in case of API error
    if (response == null) return null;
    try {
      /// Parse the retrieved response to a [StoryModel] object
      final List results = response['results'];
      return results.map((e) => StoryModel.fromJson(e)).toList();
    } catch (runtimeError) {
      /// Handle parsing errors to the core runtime errors handler
      runtimeErrorHandler(runtimeError);
      return null;
    }
  }
}
