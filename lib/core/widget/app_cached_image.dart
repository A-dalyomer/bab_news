import 'package:bab_news/core/widget/app_circle_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Cached image widget with some customization parameters
class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
    super.key,
  });
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) =>
            const Center(child: AppCircleIndicator()),
        fit: fit,
      ),
    );
  }
}
