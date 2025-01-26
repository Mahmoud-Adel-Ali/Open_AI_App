import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/styless.dart';

class EmptyChatHistory extends StatelessWidget {
  const EmptyChatHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Lottie.asset(
          AppImages.lottieEmptyChatHistory,
          fit: BoxFit.scaleDown,
        ),
        const Text(
          "No chat history found !",
          style: Styless.textRegular14,
        ),
      ],
    );
  }
}
