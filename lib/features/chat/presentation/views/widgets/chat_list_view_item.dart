import 'package:flutter/material.dart';

import '../../../data/models/chat_model.dart';
import 'ai_message.dart';
import 'user_message.dart';

class ChatListViewItem extends StatelessWidget {
  const ChatListViewItem({super.key, required this.chatModel});
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserMessage(
          message: chatModel.message,
          dateTime: chatModel.dateTime,
          imagesUrls: chatModel.imagesUrls,
        ),
        AIMessage(
          message: chatModel.response,
          dateTime: chatModel.dateTime,
        ),
      ],
    );
  }
}
