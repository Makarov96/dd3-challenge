import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(
      {super.key,
      required this.imagePath,
      required this.imageHeight,
      this.borderRadius = BorderRadius.zero,
      this.imageWidth = double.infinity});
  final String imagePath;
  final double imageHeight;
  final double imageWidth;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        imagePath,
        height: imageHeight,
        width: imageWidth,
        fit: BoxFit.fill,
      ),
    );
  }
}
