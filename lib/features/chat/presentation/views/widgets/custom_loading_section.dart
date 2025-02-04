import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../manager/chatting_cubit.dart';
import 'ai_loading_message.dart';
import 'user_message.dart';

class CustomLoadingSection extends StatelessWidget {
  const CustomLoadingSection({super.key});
  List<String> getList(List<XFile> images) {
    List<String> urls = [];
    for (var image in images) {
      urls.add(image.path);
    }
    return urls;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserMessage(
          message: context.read<ChattingCubit>().message,
          dateTime: DateTime.now(),
          imagesUrls: getList(context.read<ChattingCubit>().imagesList),
        ),
        const AILoadingMessage(),
      ],
    );
  }
}
