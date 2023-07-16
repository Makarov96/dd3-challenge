import 'package:dd360_challenge/feature/home/domain/entity/stories_item.dart';

class StoriesItemModel extends StoriesItem {
  const StoriesItemModel({
    required super.resourceUri,
    required super.name,
    required super.type,
  });

  factory StoriesItemModel.fromJson(Map<String, dynamic> json) =>
      StoriesItemModel(
        resourceUri: json['resourceURI'] ?? '',
        name: json['name'] ?? '',
        type: json['type'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'resourceURI': resourceUri,
        'name': name,
        'type': type,
      };
}
