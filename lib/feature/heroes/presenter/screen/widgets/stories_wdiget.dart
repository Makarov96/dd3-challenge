import 'package:dd360_challenge/di_container.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'package:flutter/material.dart';

class StoriesWidget extends StatelessWidget {
  const StoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer(
        builder: (context, ref, child) {
          final binding = ref.watch(heroesBloc);
          return SizedBox(
            height: 150,
            width: double.infinity,
            child: binding.stories.isEmpty
                ? const Center(
                    child: Text(
                      'NO HAY HISTORIAS',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                : ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: binding.stories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Card(
                      color: Colors.black,
                      child: SizedBox(
                        width: 200,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              binding.stories[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
