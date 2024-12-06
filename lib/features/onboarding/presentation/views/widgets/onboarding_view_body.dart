import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:open_ai_app/core/utils/app_colors.dart';
import 'package:open_ai_app/core/utils/app_images.dart';
import 'package:open_ai_app/core/utils/styless.dart';
import 'package:open_ai_app/core/widgets/custom_bottom_shap.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody(
      {super.key,
      required this.pngImage,
      required this.contentText,
      this.onPressed});
  final String pngImage;
  final String contentText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: pngImage == AppImages.robot1Image ? 30 : 50),
        Image.asset(pngImage),
        const Spacer(),
        Stack(
          alignment: Alignment.center,
          children: [
            const CustomBottomShape(height: 400),
            FadeInUpBig(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      contentText,
                      style: Styless.textBold24,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      child: IconButton(
                        onPressed: onPressed,
                        icon: const Icon(
                          Icons.navigate_next,
                          color: AppColors.mainColor,
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
