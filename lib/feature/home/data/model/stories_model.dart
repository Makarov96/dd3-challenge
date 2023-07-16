import 'package:dd360_challenge/feature/home/data/model/stories_item_model.dart';
import 'package:dd360_challenge/feature/home/domain/entity/stories.dart';

class StoriesModel extends Stories {
  const StoriesModel({
    required super.available,
    required super.collectionUri,
    required super.items,
    required super.returned,
  });

  factory StoriesModel.fromJson(Map<String, dynamic> json) => StoriesModel(
        available: json['available'] ?? 0,
        collectionUri: json['collectionURI'] ?? '',
        items: List<StoriesItemModel>.from(
            json['items'].map((x) => StoriesItemModel.fromJson(x))),
        returned: json['returned'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'available': available,
        'collectionURI': collectionUri,
        'items': List<dynamic>.from(
          items.map(
            (x) => (x as StoriesItemModel).toJson(),
          ),
        ),
        'returned': returned,
      };
}
