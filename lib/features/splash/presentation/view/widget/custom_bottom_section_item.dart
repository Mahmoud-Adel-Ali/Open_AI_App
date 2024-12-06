import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_bottom_shap.dart';

class CustomBottomBottomSectionItem extends StatelessWidget {
  const CustomBottomBottomSectionItem({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      delay: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 2),
      child: CustomBottomShape(height: height),
    );
  }
}
