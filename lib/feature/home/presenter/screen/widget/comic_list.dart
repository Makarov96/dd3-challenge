import 'package:dd360_challenge/core/router/args/router_args.dart';
import 'package:dd360_challenge/core/router/screen_path.dart';
import 'package:dd360_challenge/di_container.dart';
import 'package:dd360_challenge/feature/home/presenter/bloc/listener.dart';
import 'package:dd360_challenge/feature/widgets/comic_card.dart';
import 'package:dd360_challenge/feature/widgets/circular_progress.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'package:flutter/material.dart';

class ComicList extends ConsumerWidget {
  const ComicList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(
      blocComics,
      (previus, next) => HomeListener.homeListener(previus, next, context),
    );
    final binding = ref.watch(blocComics);
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (notification.metrics.pixels ==
              notification.metrics.maxScrollExtent) {
            ref.read(blocComics.notifier).getComist();
            return true;
          }
        }
        return true;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: binding.list.length,
              itemBuilder: (context, index) {
                final imageComic =
                    '${binding.list[index].thumbnail.path}.${binding.list[index].thumbnail.extension}';
                return ComicCard(
                  onTap: () {
                    // we'd use two ways for shared data between the screen
                    final option = HeroesObjet(
                      id: binding.list[index].id.toString(),
                      imageUrl: imageComic,
                      name: binding.list[index].name,
                    );

                    ref.read(blocComics.notifier).selectOption(option: option);
                    context.go(
                      ScreenPath.heroesScreen,
                      extra: option,
                    );
                  },
                  comicName: binding.list[index].name,
                  imagePath: imageComic,
                );
              },
            ),
            binding.status == STATUSOFDATA.loading
                ? const CircularProgress()
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
