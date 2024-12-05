import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_change_theme_mode_icon.dart';
import 'custom_bottom_shape.dart';
import 'robot_fade_image.dart';

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
          TheBottomSe(),
        ],
      ),
    );
  }
}

class TheBottomSe extends StatelessWidget {
  const TheBottomSe({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomShape(height: 200.h);
  }
}
