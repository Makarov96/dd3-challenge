import 'package:dd360_challenge/feature/widgets/image_card.dart';
import 'package:flutter/material.dart';

class ComicCard extends StatelessWidget {
  const ComicCard(
      {super.key,
      required this.imagePath,
      required this.comicName,
      required this.onTap,
      this.itemHeight = 190,
      this.itemWidth = double.infinity});
  final String imagePath;
  final String comicName;
  final double itemHeight;
  final double itemWidth;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            ImageCard(
              imageHeight: itemHeight,
              imagePath: imagePath,
              borderRadius: BorderRadius.circular(5),
              imageWidth: itemWidth,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                width: 150,
                child: Text(
                  comicName,
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
