import 'package:dd360_challenge/feature/heroes/domain/entity/comic_entity.dart';
import 'package:dd360_challenge/feature/home/data/model/thumbnail_model.dart';

class ComicModel extends ComicEntity {
  const ComicModel({
    required super.id,
    required super.title,
    required super.description,
    required super.thumbnail,
  });

  factory ComicModel.fromJson(Map<String, dynamic> json) {
    return ComicModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnail: ThumbnailModel.fromJson(
        json['thumbnail'] ?? {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'thumbnail': (thumbnail as ThumbnailModel).toJson(),
    };
  }
}
