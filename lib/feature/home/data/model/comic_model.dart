import 'package:dd360_challenge/feature/home/data/model/comic_class_model.dart';
import 'package:dd360_challenge/feature/home/data/model/stories_model.dart';
import 'package:dd360_challenge/feature/home/data/model/thumbnail_model.dart';
import 'package:dd360_challenge/feature/home/domain/entity/comic_entity.dart';

class ResultComicModel extends ComicResult {
  const ResultComicModel({
    required super.id,
    required super.name,
    required super.description,
    required super.modified,
    required super.thumbnail,
    required super.resourceUri,
    required super.comics,
    required super.series,
    required super.stories,
    required super.events,
    required super.urls,
  });
  factory ResultComicModel.fromJson(Map<String, dynamic> json) =>
      ResultComicModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        modified: json['modified'] ?? 0,
        thumbnail: ThumbnailModel.fromJson(json['thumbnail'] ?? ''),
        resourceUri: json['resourceURI'],
        comics: ComicsClassModel.fromJson(json['comics'] ?? ''),
        series: ComicsClassModel.fromJson(json['series'] ?? ''),
        stories: StoriesModel.fromJson(json['stories'] ?? ''),
        events: ComicsClassModel.fromJson(json['events'] ?? ''),
        urls:
            List<UrlModel>.from(json['urls'].map((x) => UrlModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'modified': modified,
        'thumbnail': (thumbnail as ThumbnailModel).toJson(),
        'resourceURI': resourceUri,
        'comics': (comics as ComicsClassModel).toJson(),
        'series': (series as ComicsClassModel).toJson(),
        'stories': (stories as StoriesModel).toJson(),
        'events': (events as ComicsClassModel).toJson(),
        'urls': List<dynamic>.from(
          urls.map(
            (x) => (x as UrlModel).toJson(),
          ),
        ),
      };
}

class UrlModel extends Url {
  const UrlModel({
    required super.type,
    required super.url,
  });
  factory UrlModel.fromJson(Map<String, dynamic> json) => UrlModel(
        type: json['type'] ?? '',
        url: json['url'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'url': url,
      };
}
