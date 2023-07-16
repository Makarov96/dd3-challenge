import 'package:dd360_challenge/di_container.dart';
import 'package:dd360_challenge/feature/widgets/comic_card.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'package:flutter/material.dart';

class Comics extends StatelessWidget {
  const Comics({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer(
        builder: (context, ref, child) {
          final binding = ref.watch(heroesBloc);
          return SizedBox(
            height: 300,
            width: double.infinity,
            child: binding.comics.isEmpty
                ? const Center(
                    child: Text(
                      'NO HAY COMICS',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                : ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: binding.comics.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ComicCard(
                      imagePath:
                          '${binding.comics[index].thumbnail.path}.${binding.comics[index].thumbnail.extension}',
                      comicName: binding.comics[index].title,
                      itemWidth: 200,
                      onTap: () {},
                    ),
                  ),
          );
        },
      ),
    );
  }
}
