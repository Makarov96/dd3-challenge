import 'package:dd360_challenge/feature/heroes/domain/entity/entities.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

class HeroesBinding extends Equatable {
  const HeroesBinding(
      {required this.comics,
      required this.events,
      required this.series,
      required this.stories,
      required this.status});
  final List<ComicEntity> comics;
  final List<EventEntity> events;
  final List<SeriesEntity> series;
  final List<StoryEntity> stories;
  final STATUSOFDATA status;
  HeroesBinding copyWith({
    List<ComicEntity>? comics,
    List<EventEntity>? events,
    List<SeriesEntity>? series,
    List<StoryEntity>? stories,
    STATUSOFDATA? status,
  }) {
    return HeroesBinding(
      comics: comics ?? this.comics,
      events: events ?? this.events,
      series: series ?? this.series,
      stories: stories ?? this.stories,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        comics,
        events,
        series,
        stories,
        status,
      ];
}
