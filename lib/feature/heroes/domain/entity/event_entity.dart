import 'package:dd360_challenge/feature/home/domain/entity/thumbnail.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class EventEntity extends Equatable {
  const EventEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.end,
    required this.thumbnail,
  });

  final int id;
  final String title;
  final String description;
  final String end;
  final Thumbnail thumbnail;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        end,
        thumbnail,
      ];
}
