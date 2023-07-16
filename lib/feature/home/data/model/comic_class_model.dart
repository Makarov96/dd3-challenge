import 'package:dd360_challenge/feature/home/data/model/comics_item_model.dart';
import 'package:dd360_challenge/feature/home/domain/entity/comics_class.dart';

class ComicsClassModel extends ComicsClass {
  const ComicsClassModel({
    required super.available,
    required super.collectionUri,
    required super.items,
    required super.returned,
  });

  factory ComicsClassModel.fromJson(Map<String, dynamic> json) =>
      ComicsClassModel(
        available: json['available'] ?? 0,
        collectionUri: json['collectionURI'] ?? '',
        items: List<ComicsItemModel>.from(
            json['items'].map((x) => ComicsItemModel.fromJson(x))),
        returned: json['returned'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'available': available,
        'collectionURI': collectionUri,
        'items': List<dynamic>.from(
          items.map(
            (x) => (x as ComicsItemModel).toJson(),
          ),
        ),
        'returned': returned,
      };
}
