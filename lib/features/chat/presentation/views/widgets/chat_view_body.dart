import 'package:flutter/material.dart';
import 'ai_loading_message.dart';
import 'ai_message.dart';
import 'send_message_section.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //ToDo :chat list view
        // Ex
        AIMessage(message: "message"),
        AILoadingMessage(),
        AIMessage(message: "message"),
        AIMessage(message: "message"),
        AIMessage(message: "message"),
        SendMessageSection(),
      ],
    );
  }
}
