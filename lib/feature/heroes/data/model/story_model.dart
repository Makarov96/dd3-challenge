import 'package:dd360_challenge/feature/heroes/domain/entity/story_entity.dart';

class StoryModel extends StoryEntity {
  const StoryModel({
    required super.resourceURI,
    required super.name,
    required super.title,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      resourceURI: json['resourceURI'] ?? '',
      name: json['name'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceURI': resourceURI,
      'name': name,
      'title': title,
    };
  }
}
