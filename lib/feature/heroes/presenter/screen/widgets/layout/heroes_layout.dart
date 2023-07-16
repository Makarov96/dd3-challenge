import 'package:dd360_challenge/feature/heroes/presenter/screen/widgets/comics.dart';
import 'package:dd360_challenge/feature/heroes/presenter/screen/widgets/events.dart';
import 'package:dd360_challenge/feature/heroes/presenter/screen/widgets/series.dart';
import 'package:dd360_challenge/feature/heroes/presenter/screen/widgets/stories_wdiget.dart';
import 'package:dd360_challenge/feature/widgets/image_card.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'package:flutter/material.dart';

class HeroesLayout extends StatelessWidget {
  const HeroesLayout({
    super.key,
    required this.imagePath,
    required this.name,
  });
  final String imagePath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ImageCard(
                imagePath: imagePath,
                imageHeight: 400,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 20),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'COMICS',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const Comics(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'SERIES',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const Series(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'EVENTOS',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const Events(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'HISTORIAS',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const StoriesWidget(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
              ),
            ),
          ],
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 300,
          child: FloatingActionButton.small(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => context.pop(),
          ),
        ),
      ],
    );
  }
}
