import 'package:dd360_challenge/feature/heroes/data/model/models.dart';
import 'package:dd360_challenge/feature/heroes/domain/entity/comic_entity.dart';
import 'package:dd360_challenge/feature/heroes/domain/entity/event_entity.dart';
import 'package:dd360_challenge/feature/heroes/domain/entity/series_entity.dart';
import 'package:dd360_challenge/feature/heroes/domain/entity/story_entity.dart';
import 'package:dd360_challenge/feature/heroes/domain/repository/heroes_repository.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class HeroApi extends HeroesRepository {
  HeroApi({
    required HttpInteface http,
  }) : _http = http;
  final HttpInteface _http;

  @override
  Future<Result<List<ComicEntity>, CustomErrors>> comics({
    required String id,
  }) async {
    try {
      final endPoint = '/v1/public/characters/$id/comics?limit=25&offset=0';
      final result = await _http.get(endPoint);
      return result.when(
        ok: (data) {
          final results = data.results
              .map(
                (item) => ComicModel.fromJson(item),
              )
              .toList();

          return Result.ok(results);
        },
        err: (error, _) {
          return Result.err(
            ServerException(
              serverMessage: error,
            ),
          );
        },
      );
    } on CustomErrors catch (t, _) {
      t.printer();
      rethrow;
    }
  }

  @override
  Future<Result<List<EventEntity>, CustomErrors>> events({
    required String id,
  }) async {
    try {
      final endPoint = '/v1/public/characters/$id/events?limit=25&offset=0';
      final result = await _http.get(endPoint);
      return result.when(
        ok: (data) {
          final results = data.results
              .map(
                (item) => EventModel.fromJson(item),
              )
              .toList();
          return Result.ok(results);
        },
        err: (error, _) {
          return Result.err(
            ServerException(
              serverMessage: error,
            ),
          );
        },
      );
    } on CustomErrors catch (t, _) {
      t.printer();
      rethrow;
    }
  }

  @override
  Future<Result<List<SeriesEntity>, CustomErrors>> series({
    required String id,
  }) async {
    try {
      final endPoint = '/v1/public/characters/$id/series?limit=25&offset=0';
      final result = await _http.get(endPoint);
      return result.when(
        ok: (data) {
          final results = data.results
              .map(
                (item) => SeriesModel.fromJson(item),
              )
              .toList();
          return Result.ok(results);
        },
        err: (err, _) {
          return Result.err(
            ServerException(serverMessage: err),
          );
        },
      );
    } on CustomErrors catch (t, _) {
      t.printer();
      rethrow;
    }
  }

  @override
  Future<Result<List<StoryEntity>, CustomErrors>> stories(
      {required String id}) async {
    try {
      final endPoint = '/v1/public/characters/$id/stories?limit=25&offset=0';
      final result = await _http.get(endPoint);
      return result.when(
        ok: (data) {
          final results =
              data.results.map((item) => StoryModel.fromJson(item)).toList();
          return Result.ok(results);
        },
        err: (err, _) {
          return Result.err(
            ServerException(
              serverMessage: err,
            ),
          );
        },
      );
    } on CustomErrors catch (t, _) {
      t.printer();
      rethrow;
    }
  }
}
