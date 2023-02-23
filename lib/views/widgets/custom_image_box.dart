import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'custom_circlur_progress.dart';

class CustomImageBox extends StatelessWidget {
  final String imageUrl;
  const CustomImageBox({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) {
          return const Center(child: CustomCircularProgress());
        },
        errorWidget: (context, url, error) => const Icon(Icons.error_rounded),
      ),
    );
  }
}
