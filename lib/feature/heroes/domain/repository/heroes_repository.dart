import 'package:dd360_challenge/feature/heroes/domain/entity/entities.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

abstract class HeroesRepository {
  Future<Result<List<ComicEntity>, CustomErrors>> comics({
    required String id,
  });

  Future<Result<List<EventEntity>, CustomErrors>> events({
    required String id,
  });

  Future<Result<List<SeriesEntity>, CustomErrors>> series({
    required String id,
  });

  Future<Result<List<StoryEntity>, CustomErrors>> stories({
    required String id,
  });
}
