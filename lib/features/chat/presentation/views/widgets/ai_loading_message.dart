import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/app_images.dart';
import 'chat_logo.dart';

class AILoadingMessage extends StatelessWidget {
  const AILoadingMessage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chat Logo
          const ChatLogo(logo: AppImages.logoChat),
          const SizedBox(width: 12),
          Flexible(
            child: Lottie.asset(
              AppImages.loadingIndicatorLottie,
              height: 50,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}
