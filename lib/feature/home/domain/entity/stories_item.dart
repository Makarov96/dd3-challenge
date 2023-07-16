import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class StoriesItem extends Equatable {
  const StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  final String resourceUri;
  final String name;
  final String type;

  @override
  List<Object?> get props => [
        resourceUri,
        name,
        type,
      ];
}
