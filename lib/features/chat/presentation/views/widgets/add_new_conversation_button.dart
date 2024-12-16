import 'package:flutter/material.dart';

import 'add_new_conversation_dialog_body.dart';

class AddNewConversationButton extends StatelessWidget {
  const AddNewConversationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return const AddNewConversationDialogBody();
          },
        );
      },
      icon: const Icon(
        Icons.add_box_rounded,
        size: 35,
      ),
    );
  }
}
