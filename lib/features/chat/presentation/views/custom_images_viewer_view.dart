import 'package:flutter/material.dart';

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
    );
  }
}
