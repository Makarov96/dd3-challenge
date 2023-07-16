import 'package:dd360_challenge/feature/home/domain/entity/stories_item.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class Stories extends Equatable {
  const Stories({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });
  final num available;
  final String collectionUri;
  final List<StoriesItem> items;
  final num returned;

  @override
  List<Object> get props => [
        available,
        collectionUri,
        items,
        returned,
      ];
}
