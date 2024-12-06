import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:open_ai_app/core/utils/styless.dart';
import 'package:open_ai_app/core/widgets/custom_bottom_shap.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody(
      {super.key, required this.pngImage, required this.contentText});
  final String pngImage;
  final String contentText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30.0),
        Image.asset(pngImage),
        const Spacer(),
        Stack(
          alignment: Alignment.center,
          children: [
            const CustomBottomShape(height: 400),
            FadeInUpBig(
              child: Column(
                children: [
                  Text(
                    contentText,
                    style: Styless.textBold24,
                  ),
                  const SizedBox(height: 20),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.navigate_next,
                      size: 60,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
