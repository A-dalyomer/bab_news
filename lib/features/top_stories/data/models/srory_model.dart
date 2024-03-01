import 'package:bab_news/features/top_stories/domain/entities/story_entity.dart';

class StoryModel extends StoryEntity {
  const StoryModel({
    required super.section,
    required super.images,
    required super.title,
    required super.abstractDescription,
    required super.url,
    required super.author,
    required super.publishedDate,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      section: json['section'],
      images:
          (json['multimedia'] as List).map((e) => e['url'].toString()).toList(),
      title: json['title'],
      abstractDescription: json['abstract'],
      url: json['url'],
      author: json['byline'],
      publishedDate: DateTime.parse(
        json['published_date'],
      ),
    );
  }
}
