import 'package:dd360_challenge/feature/heroes/domain/entity/event_entity.dart';
import 'package:dd360_challenge/feature/home/data/model/thumbnail_model.dart';

class EventModel extends EventEntity {
  const EventModel({
    required super.id,
    required super.title,
    required super.description,
    required super.end,
    required super.thumbnail,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      end: json['end'] ?? '',
      thumbnail: ThumbnailModel.fromJson(
        json['thumbnail'] ?? {},
      ),
    );
  }
}
