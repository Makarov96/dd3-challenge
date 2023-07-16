import 'package:dd360_challenge/feature/home/domain/entity/thumbnail.dart';

class ThumbnailModel extends Thumbnail {
  const ThumbnailModel({
    required super.path,
    required super.extension,
  });

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) => ThumbnailModel(
        path: json['path'] ?? '',
        extension: json['extension'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'path': path,
        'extension': extension,
      };
}
