import 'package:flutter/material.dart';
import 'package:open_ai_app/core/widgets/custom_change_theme_mode_icon.dart';
import 'package:open_ai_app/features/splash/presentation/view/widget/robot_fade_image.dart';

import 'custom_bottom_container.dart';

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
          CustomBottomContainer(height: 400),
        ],
      ),
    );
  }
}
