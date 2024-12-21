import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../manager/chating_cubit.dart';

class CustomImagesListView extends StatelessWidget {
  const CustomImagesListView({super.key, required this.images});
  final List<XFile>? images;
  @override
  Widget build(BuildContext context) {
    return (images == null || images!.isEmpty)
        ? const SizedBox()
        : SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        context
                            .read<ChatingCubit>()
                            .deleteImage(images![index]);
                      },
                      child: CustomSelectedImageBox(path: images![index].path)),
                );
              },
            ),
          );
  }
}

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
      child: Image.file(
        File(path),
        fit: BoxFit.cover,
        width: 100,
      ),
    );
  }
}
