import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/news_model.dart';

class NewsTileItem extends StatelessWidget {
  const NewsTileItem({super.key, required this.article});
  final NewsModel article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: article.image != null
              ? CachedNetworkImage(
                  //building the image and adding proprties
                  imageBuilder: (context, imageProvider) {
                    return FittedBox(
                      fit: BoxFit.fill,
                      child: Image(image: imageProvider),
                    );
                  },
                  imageUrl: article.image!,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image.asset(
                  'assets/default_img.jpg',
                ),
          // article.image != null
          //     ? Image.network(
          //         article.image!,
          //         height: 200,
          //         width: double.infinity,
          //         fit: BoxFit.fill,
          //       )
          //     : Image.asset(
          //         'assets/default_img.jpg',
          //       ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            article.title,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            // ?? operator checks if left side is null then uses the right side
            article.desc ?? '',
            maxLines: 3,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
