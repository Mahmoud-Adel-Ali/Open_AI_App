import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/chatting_cubit.dart';
import 'custom_dialog.dart';

class AddNewConversationDialogBody extends StatelessWidget {
  const AddNewConversationDialogBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      description:
          "Are you sure you want to close this chat page and start a new conversation? 🙂",
      onTapYes: () {
        context.read<ChattingCubit>().openNewChatRoom();
        Navigator.pop(context);
      },
    );
  }
}
