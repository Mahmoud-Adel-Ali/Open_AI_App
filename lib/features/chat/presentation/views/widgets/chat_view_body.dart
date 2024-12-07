import 'package:flutter/material.dart';
import 'send_message_section.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //ToDo :chat list view
        Expanded(child: SizedBox()),
        SendMessageSection(),
      ],
    );
  }
}
