import 'package:dd360_challenge/core/router/args/router_args.dart';
import 'package:dd360_challenge/feature/heroes/presenter/screen/widgets/layout/heroes_layout.dart';
import 'package:flutter/material.dart';

class HeroesScreen extends StatelessWidget {
  const HeroesScreen({
    super.key,
    required this.object,
  });
  final HeroesObjet object;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeroesLayout(
        imagePath: object.imageUrl,
        name: object.name,
      ),
    );
  }
}
