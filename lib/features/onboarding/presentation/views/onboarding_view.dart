import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';
import 'widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingViewBody(
        contentText:
            "Start Chatting With Our Chatbot to get instant answers to your questions !",
        pngImage: AppImages.robot1Image,
      ),
    );
  }
}
