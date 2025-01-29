import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styless.dart';
import 'custom_elevated_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.description,
    this.onTapYes,
  });
  final String description;
  final void Function()? onTapYes;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200,
        width: MediaQuery.sizeOf(context).width * 0.9,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              description,
              style: Styless.textMedium20,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomElevatedButton(
                  text: "No  ❌",
                  color: AppColors.error,
                  onPerssed: () {
                    Navigator.pop(context);
                  },
                ),
                CustomElevatedButton(
                  text: 'Yes  ✅',
                  onPerssed: onTapYes,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
