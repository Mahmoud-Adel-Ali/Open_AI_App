import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styless.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPerssed,
    this.color,
  });
  final String text;
  final void Function()? onPerssed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPerssed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          color ?? AppColors.success,
        ),
      ),
      child: Text(
        text,
        style: Styless.textMedium20.copyWith(
          color: AppColors.lightTextColor,
        ),
      ),
    );
  }
}
