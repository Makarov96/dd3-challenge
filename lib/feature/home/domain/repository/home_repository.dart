import 'package:dd360_challenge/feature/home/domain/entity/comic_entity.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

abstract class HomeRepository {
  Future<Result<List<ComicResult>, CustomErrors>> getCharacters({
    required int offset,
  });
}
