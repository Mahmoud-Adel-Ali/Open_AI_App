import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_ai_app/core/utils/styless.dart';

import '../../../../../core/widgets/custom_bottom_shap.dart';
import '../../../../onboarding/presentation/views/onboarding_view.dart';
import 'custom_bottom_section_item.dart';

class TheBottomSection extends StatefulWidget {
  const TheBottomSection({super.key});

  @override
  State<TheBottomSection> createState() => _TheBottomSectionState();
}

class _TheBottomSectionState extends State<TheBottomSection> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        counter++;
        if (counter == 4) {
          timer.cancel();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OnboardingView(),
              ));
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        counter == 1
            ? CustomBottomBottomSectionItem(height: 200.h)
            : CustomBottomShape(height: 300.h),
        counter > 1
            ? counter == 2
                ? CustomBottomBottomSectionItem(height: 400.h)
                : CustomBottomShape(height: 400.h)
            : SizedBox(),
        counter == 3 ? const HelloText() : const SizedBox(),
      ],
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: const Text(
          'HELLO !',
          style: Styless.textBold48,
        ),
      ),
    );
  }
}
