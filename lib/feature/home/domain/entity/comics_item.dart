import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class ComicsItem extends Equatable {
  const ComicsItem({
    required this.resourceUri,
    required this.name,
  });
  final String resourceUri;
  final String name;

  @override
  List<Object?> get props => [
        resourceUri,
        name,
      ];
}
