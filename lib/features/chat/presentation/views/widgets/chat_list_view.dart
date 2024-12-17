import 'package:flutter/material.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/chat_list_view_item.dart';

import '../../../data/models/chat_model.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ChatListViewItem(
          chatModel: ChatModel(
            chatId: '',
            message: 'message user ya pash',
            response: 'response ai ya gale',
            imagesUrls: [],
            dateTime: DateTime.now(),
          ),
        );
      },
    );
  }
}
