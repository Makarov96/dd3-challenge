import 'package:dd360_challenge/di_container.dart';
import 'package:dd360_challenge/feature/widgets/comic_card.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer(
        builder: (context, ref, child) {
          final binding = ref.watch(heroesBloc);
          return SizedBox(
            height: 270,
            width: double.infinity,
            child: binding.events.isEmpty
                ? const Center(
                    child: Text(
                      'NO HAY EVENTOS',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                : ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: binding.events.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ComicCard(
                      imagePath:
                          '${binding.events[index].thumbnail.path}.${binding.events[index].thumbnail.extension}',
                      comicName: binding.events[index].title,
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
