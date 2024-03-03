import 'package:equatable/equatable.dart';

class StoryEntity extends Equatable {
  const StoryEntity({
    required this.section,
    required this.images,
    required this.title,
    required this.abstractDescription,
    required this.url,
    required this.publishedDate,
    required this.author,
  });
  final String section;
  final List<String> images;
  final String title;
  final String abstractDescription;
  final String url;
  final String author;
  final DateTime publishedDate;

  @override
  List<Object?> get props => [
        images,
        title,
        abstractDescription,
        url,
        publishedDate,
        author,
      ];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['images'] = images;
    data['title'] = title;
    data['abstractDescription'] = abstractDescription;
    data['url'] = url;
    data['publishedDate'] = publishedDate;
    data['author'] = author;
    return data;
  }
}
