import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/app_cached_image.dart';

class StoriesCarousel extends StatelessWidget {
  const StoriesCarousel({
    super.key,
    required this.height,
    required this.images,
    required this.url,
  });
  final double height;
  final List<String> images;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: height,
          child: CarouselSlider(
            items: [
              for (int i = 0; i < images.length; i++)
                PageStorage(
                  bucket: PageStorageBucket(),
                  child: Hero(
                    tag: images[i] + i.toString(),
                    child: AppCachedImage(
                      imageUrl: images[i],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
            ],
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1,
              enlargeCenterPage: true,
              viewportFraction: 1,
            ),
          ),
        ),
      ),
    );
  }
}
