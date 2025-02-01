import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class CustomImagesViewerView extends StatelessWidget {
  const CustomImagesViewerView({
    super.key,
    required this.imagesUrls,
  });
  final List<String> imagesUrls;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images Viewer'),
      ),
      body: ImageViewerBody(imagesUrls: imagesUrls),
    );
  }
}

class ImageViewerBody extends StatelessWidget {
  const ImageViewerBody({super.key, required this.imagesUrls});
  final List<String> imagesUrls;

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      enableRotation: true,
      backgroundDecoration:
          BoxDecoration(color: Theme.of(context).colorScheme.primary),
      itemCount: imagesUrls.length,
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(imagesUrls[index]),
          initialScale: PhotoViewComputedScale.contained * 0.99,
          heroAttributes: PhotoViewHeroAttributes(tag: index),
          filterQuality: FilterQuality.high,
        );
      },
    );
  }
}
