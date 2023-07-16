import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';

sealed class RouterArgs<T> extends Equatable {
  const RouterArgs();
}

class HeroesObjet extends RouterArgs {
  const HeroesObjet({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String imageUrl;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
      ];

  @override
  String toString() {
    return 'HeroesObjet(id: $id, name: $name, imageUrl: $imageUrl)';
  }
}
