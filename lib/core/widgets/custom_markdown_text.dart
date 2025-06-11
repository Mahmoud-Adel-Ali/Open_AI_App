import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../utils/app_colors.dart';
import '../utils/styless.dart';

class CustomMarkdownText extends StatelessWidget {
  const CustomMarkdownText({super.key, required this.text, this.textColor});
  final String text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Markdown(
      // controller: controller,
      onTapLink: (context, href, title) {
        log(href ?? 'No href');
      },
      softLineBreak: true,
      selectable: true,
      data: text,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      styleSheet: MarkdownStyleSheet(
        p: Styless.textRegular14.copyWith(color: textColor),
        a: Styless.textRegular14.copyWith(color: AppColors.error),
        h1: Styless.textBold24.copyWith(color: textColor),
        h2: Styless.textSemiBold18.copyWith(color: textColor),
        code: Styless.textRegular14.copyWith(color: AppColors.success),
      ),
    );
  }
}
