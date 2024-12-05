import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_change_theme_mode_icon.dart';
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
          CustomChangeThemeModeIcon(),
          Spacer(),
          TheBottomSection(),
        ],
      ),
    );
  }
}
