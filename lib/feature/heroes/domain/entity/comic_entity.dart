import 'package:dd360_challenge/feature/home/domain/entity/thumbnail.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class ComicEntity extends Equatable {
  const ComicEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
  });

  final int id;
  final String title;
  final String description;
  final Thumbnail thumbnail;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        thumbnail,
      ];
}
