import 'package:dd360_challenge/feature/home/domain/entity/thumbnail.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class SeriesEntity extends Equatable {
  const SeriesEntity({
    required this.resourceURI,
    required this.name,
    required this.title,
    required this.thumbnail,
  });

  final String resourceURI;
  final String name;
  final String title;
  final Thumbnail thumbnail;

  @override
  List<Object?> get props => [
        resourceURI,
        name,
        title,
        thumbnail,
      ];
}
