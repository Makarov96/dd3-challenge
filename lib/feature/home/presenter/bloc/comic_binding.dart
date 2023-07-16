import 'package:dd360_challenge/core/router/args/router_args.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'package:dd360_challenge/feature/home/domain/entity/comic_entity.dart';

class ComicBinding extends Equatable {
  const ComicBinding({
    required this.list,
    required this.status,
    this.option,
  });
  final List<ComicResult> list;
  final HeroesObjet? option;
  final STATUSOFDATA status;
  ComicBinding copyWith(
      {List<ComicResult>? list, STATUSOFDATA? status, HeroesObjet? option}) {
    return ComicBinding(
      list: list ?? this.list,
      status: status ?? this.status,
      option: option ?? this.option,
    );
  }

  @override
  List<Object?> get props => [
        list,
        status,
        option,
      ];
}
