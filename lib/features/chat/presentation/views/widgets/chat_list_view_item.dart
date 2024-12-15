import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/styless.dart';
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
        Text(
          DateFormat('hh:mm a').format(chatModel.dateTime),
          style: Styless.textRegular10,
        ),
        UserMessage(
          message: chatModel.message,
          dateTime: chatModel.dateTime,
        ),
        AIMessage(
          message: chatModel.response,
          dateTime: chatModel.dateTime,
        ),
      ],
    );
  }
}
