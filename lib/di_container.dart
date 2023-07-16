import 'package:dd360_challenge/feature/heroes/data/repository/hero_api.dart';
import 'package:dd360_challenge/feature/heroes/presenter/bloc/heroes_binding.dart';
import 'package:dd360_challenge/feature/home/data/repository/home_api.dart';
import 'package:dd360_challenge/feature/home/presenter/bloc/comic_binding.dart';
import 'package:dd360_challenge/feature/home/presenter/bloc/comics_bloc.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'feature/heroes/domain/repository/heroes_repository.dart';
import 'feature/heroes/presenter/bloc/heroes_bloc.dart';
import 'feature/home/domain/repository/home_repository.dart';

final _client = Provider<Client>((ref) => Client());

final _crypto = Provider<DD3Cryto>(
  (ref) => DD3Hash(),
);

final _http = Provider<HttpInteface>(
  (ref) => HttpDD3(
    baseUrl: GlobalValues.baseUrl,
    client: ref.read(_client),
    dd3crypto: ref.read(_crypto),
    publicKey: GlobalValues.publicKey,
  ),
);

final _homeRepository = Provider<HomeRepository>(
  (ref) => HomeApi(
    http: ref.read(_http),
  ),
);

final _heroesRepository = Provider<HeroesRepository>(
  (ref) => HeroApi(
    http: ref.read(_http),
  ),
);

final blocComics = StateNotifierProvider<BlocComics, ComicBinding>(
  (ref) => BlocComics(
    const ComicBinding(
      list: [],
      status: STATUSOFDATA.init,
    ),
    repository: ref.read(
      _homeRepository,
    ),
  ),
);

final heroesBloc = StateNotifierProvider<HeroesBloc, HeroesBinding>(
  (ref) {
    final option = ref.watch(blocComics).option;
    return HeroesBloc(
      const HeroesBinding(
        status: STATUSOFDATA.init,
        comics: [],
        events: [],
        series: [],
        stories: [],
      ),
      repository: ref.read(
        _heroesRepository,
      ),
      id: option?.id ?? '',
    );
  },
);
final themeHandler = StateProvider<bool>((ref) => false);
