import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styless.dart';
import '../../manager/chating_cubit.dart';
import 'custom_elevated_button.dart';

class AddNewConversationDialogBody extends StatelessWidget {
  const AddNewConversationDialogBody({
    super.key,
  });

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
            const Text(
              "Are you sure you want to close this chat page and start a new conversation? 🙂",
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
                  onPerssed: () {
                    context.read<ChatingCubit>().openNewChatRoom();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
