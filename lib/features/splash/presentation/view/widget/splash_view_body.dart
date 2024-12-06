import 'package:flutter/material.dart';
import 'robot_fade_image.dart';
import 'the_bottom_section.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30.0),
          RobotFadeImage(),
          Spacer(),
          TheBottomSection(),
        ],
      ),
    );
  }
}
