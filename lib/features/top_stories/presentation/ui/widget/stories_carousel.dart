import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/app_cached_image.dart';

/// Carousel slider with customized goal to present the provided story images
/// that can be customized depending on where it is used
/// with nice UI and small animations
class StoriesCarousel extends StatelessWidget {
  const StoriesCarousel({
    super.key,
    required this.height,
    required this.images,
    this.contentFit = BoxFit.cover,
    this.autoPlay = false,
    this.viewportFraction = 1,
  });
  final double height;
  final List<String> images;
  final BoxFit contentFit;
  final bool autoPlay;
  final double viewportFraction;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CarouselSlider(
        items: [
          for (int i = 0; i < images.length; i++)
            Hero(
              tag: images[i] + i.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AppCachedImage(
                  imageUrl: images[i],
                  fit: contentFit,
                  width: double.infinity,
                ),
              ),
            ),
        ],
        options: CarouselOptions(
          autoPlay: autoPlay,
          enlargeCenterPage: true,
          viewportFraction: viewportFraction,
          height: height,
        ),
      ),
    );
  }
}
