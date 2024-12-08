import 'package:flutter/material.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/user_message.dart';
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
        AIMessage(
          message:
              "message message message message message message message message message",
        ),
        UserMessage(message: 'User Message'),
        AILoadingMessage(),
        Expanded(child: SizedBox()),
        SendMessageSection(),
      ],
    );
  }
}
