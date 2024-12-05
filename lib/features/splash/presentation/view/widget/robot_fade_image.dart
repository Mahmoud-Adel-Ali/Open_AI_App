import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:open_ai_app/core/utils/app_images.dart';

class RobotFadeImage extends StatelessWidget {
  const RobotFadeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDownBig(
      curve: Curves.fastEaseInToSlowEaseOut,
      delay: const Duration(milliseconds: 100),
      child: Image.asset(
        AppImages.robot1Image,
      ),
    );
  }
}
