import 'package:dd360_challenge/feature/home/domain/entity/comics_class.dart';
import 'package:dd360_challenge/feature/home/domain/entity/stories.dart';
import 'package:dd360_challenge/feature/home/domain/entity/thumbnail.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class ComicResult extends Equatable {
  const ComicResult({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  final num id;
  final String name;
  final String description;
  final String modified;
  final Thumbnail thumbnail;
  final String resourceUri;
  final ComicsClass comics;
  final ComicsClass series;
  final Stories stories;
  final ComicsClass events;
  final List<Url> urls;

  @override
  List<Object> get props => [
        id,
        name,
        description,
        modified,
        thumbnail,
        resourceUri,
        comics,
        series,
        stories,
        events,
        urls,
      ];
}

class Url extends Equatable {
  const Url({
    required this.type,
    required this.url,
  });

  final String type;
  final String url;

  @override
  List<Object> get props => [
        type,
        url,
      ];
}
