import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class StoryEntity extends Equatable {
  const StoryEntity({
    required this.resourceURI,
    required this.name,
    required this.title,
  });

  final String resourceURI;
  final String name;
  final String title;

  @override
  List<Object?> get props => [
        resourceURI,
        name,
        title,
      ];
}
