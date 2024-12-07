import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:open_ai_app/features/chat/presentation/views/chat_view.dart';

import '../../../../core/utils/app_images.dart';
import 'widgets/onboarding_view_body.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: page == 1
          ? OnboardingViewBody(
              contentText:
                  "Start Chatting With Our Chatbot to get instant answers to your questions !",
              pngImage: AppImages.robot1Image,
              onPressed: () {
                page++;
                setState(() {});
              },
            )
          : FadeInUp(
              child: OnboardingViewBody(
                contentText:
                    "Where you can create images find things from photo, and more !",
                pngImage: AppImages.robot2Image,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatView()));
                },
              ),
            ),
    );
  }
}
