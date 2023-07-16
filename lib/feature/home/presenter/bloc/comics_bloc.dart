import 'package:dd360_challenge/core/router/args/router_args.dart';
import 'package:dd360_challenge/feature/home/domain/entity/comic_entity.dart';
import 'package:dd360_challenge/feature/home/domain/repository/home_repository.dart';
import 'package:dd360_challenge/feature/home/presenter/bloc/comic_binding.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class BlocComics extends BaseStateNotifier<ComicBinding> {
  BlocComics(
    super.state, {
    required HomeRepository repository,
  }) : _repository = repository {
    getComist();
  }

  void selectOption({
    required HeroesObjet option,
  }) {
    state = state.copyWith(option: option);
  }

  final HomeRepository _repository;
  int offset = 25;
  List<ComicResult> comicsOnMemory = [];
  void getComist() async {
    state = state.copyWith(status: STATUSOFDATA.loading);
    final either = await _repository.getCharacters(offset: offset);
    either.when(
      ok: (data) {
        comicsOnMemory.addAll(data);
        state = state.copyWith(
          list: comicsOnMemory,
          status: STATUSOFDATA.success,
        );

        offset += 25;
      },
      err: (err) {
        statusofdata = STATUSOFDATA.failure;
      },
    );
  }
}
