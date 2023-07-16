import 'package:dd360_challenge/feature/heroes/domain/repository/heroes_repository.dart';
import 'package:dd360_challenge/feature/heroes/presenter/bloc/heroes_binding.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class HeroesBloc extends BaseStateNotifier<HeroesBinding> {
  HeroesBloc(
    super.state, {
    required this.id,
    required HeroesRepository repository,
  }) : _repository = repository {
    init();
  }

  final HeroesRepository _repository;
  final String id;

  void init() async {
    statusofdata = STATUSOFDATA.loading;
    state = state.copyWith(status: statusofdata);
    await Future.wait(
      [
        comics(id: id),
        events(id: id),
        series(id: id),
        stories(id: id),
      ],
    );
    statusofdata = STATUSOFDATA.success;
    state = state.copyWith(status: statusofdata);
  }

  Future<void> comics({
    required String id,
  }) async {
    final either = await _repository.comics(id: id);
    either.when(
      ok: (comics) {
        state = state.copyWith(
          comics: comics,
        );
      },
      err: (err) {
        statusofdata = STATUSOFDATA.failure;
        state = state.copyWith(status: statusofdata);
      },
    );
  }

  Future<void> events({
    required String id,
  }) async {
    final either = await _repository.events(id: id);
    either.when(
      ok: (events) {
        state = state.copyWith(
          events: events,
        );
      },
      err: (err) {
        statusofdata = STATUSOFDATA.failure;
        state = state.copyWith(status: statusofdata);
      },
    );
  }

  Future<void> series({
    required String id,
  }) async {
    final either = await _repository.series(id: id);
    either.when(
      ok: (series) {
        state = state.copyWith(
          series: series,
        );
      },
      err: (err) {
        statusofdata = STATUSOFDATA.failure;
        state = state.copyWith(status: statusofdata);
      },
    );
  }

  Future<void> stories({
    required String id,
  }) async {
    final either = await _repository.stories(id: id);
    either.when(
      ok: (stories) {
        state = state.copyWith(
          stories: stories,
        );
      },
      err: (err) {
        statusofdata = STATUSOFDATA.failure;
        state = state.copyWith(status: statusofdata);
      },
    );
  }
}
