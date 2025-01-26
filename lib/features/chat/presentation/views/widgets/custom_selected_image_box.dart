import 'dart:io';
import 'package:flutter/material.dart';

class CustomSelectedImageBox extends StatelessWidget {
  const CustomSelectedImageBox({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.file(File(path), fit: BoxFit.cover, width: 100),
    );
  }
}
