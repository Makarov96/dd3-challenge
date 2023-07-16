import 'package:dd360_challenge/feature/home/domain/entity/comics_item.dart';

class ComicsItemModel extends ComicsItem {
  const ComicsItemModel({
    required super.resourceUri,
    required super.name,
  });

  factory ComicsItemModel.fromJson(Map<String, dynamic> json) =>
      ComicsItemModel(
        resourceUri: json['resourceURI'] ?? '',
        name: json['name'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'resourceURI': resourceUri,
        'name': name,
      };
}
