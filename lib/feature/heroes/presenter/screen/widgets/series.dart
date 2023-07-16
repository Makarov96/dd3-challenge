import 'package:dd360_challenge/di_container.dart';
import 'package:dd360_challenge/feature/widgets/comic_card.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'package:flutter/material.dart';

class Series extends StatelessWidget {
  const Series({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final binding = ref.watch(heroesBloc);
        return binding.series.isEmpty
            ? const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'NO HAY SERIES',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              )
            : SliverGrid.builder(
                itemCount: binding.series.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) => ComicCard(
                  imagePath:
                      '${binding.series[index].thumbnail.path}.${binding.series[index].thumbnail.extension}',
                  comicName: binding.series[index].title,
                  itemWidth: 200,
                  onTap: () {},
                ),
              );
      },
    );
  }
}
