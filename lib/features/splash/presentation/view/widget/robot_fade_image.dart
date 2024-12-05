import 'package:flutter/material.dart';
import 'package:open_ai_app/core/utils/app_images.dart';

class RobotFadeImage extends StatelessWidget {
  const RobotFadeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Image.asset(
        AppImages.robot1Image,
      ),
    );
  }
}
