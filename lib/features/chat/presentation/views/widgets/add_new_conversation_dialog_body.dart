import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/chating_cubit.dart';
import 'custom_dialog.dart';

class AddNewConversationDialogBody extends StatelessWidget {
  const AddNewConversationDialogBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      discription:
          "Are you sure you want to close this chat page and start a new conversation? 🙂",
      onTapYes: () {
        context.read<ChatingCubit>().openNewChatRoom();
        Navigator.pop(context);
      },
    );
  }
}
