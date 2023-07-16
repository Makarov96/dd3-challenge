import 'package:dd360_challenge/feature/heroes/domain/entity/series_entity.dart';
import 'package:dd360_challenge/feature/home/data/model/thumbnail_model.dart';

class SeriesModel extends SeriesEntity {
  const SeriesModel({
    required super.resourceURI,
    required super.name,
    required super.title,
    required super.thumbnail,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      resourceURI: json['resourceURI'] ?? '',
      name: json['name'] ?? '',
      thumbnail: ThumbnailModel.fromJson(json['thumbnail'] ?? {}),
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceURI': resourceURI,
      'name': name,
      'title': title,
      'thumbnail': (thumbnail as ThumbnailModel).toJson(),
    };
  }
}
