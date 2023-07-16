import 'package:dd360_challenge/feature/home/data/model/comic_model.dart';
import 'package:dd360_challenge/feature/home/domain/entity/comic_entity.dart';
import 'package:dd360_challenge/feature/home/domain/repository/home_repository.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class HomeApi extends HomeRepository {
  HomeApi({
    required HttpInteface http,
  }) : _http = http;
  final HttpInteface _http;
  @override
  Future<Result<List<ComicResult>, CustomErrors>> getCharacters({
    required int offset,
  }) async {
    try {
      final endPoint = '/v1/public/characters?&limit=25&offset=$offset';
      final futureResult = await _http.get(endPoint);
      return futureResult.when(
        ok: (data) {
          final results = data.results
              .map((item) => ResultComicModel.fromJson(item))
              .toList();
          return Result.ok(results);
        },
        err: (errorMessage, _) {
          return Result.err(
            ServerException(
              serverMessage: errorMessage,
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
