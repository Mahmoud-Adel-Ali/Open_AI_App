import 'package:flutter/material.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/chat_list_view.dart';
import 'ai_loading_message.dart';
import 'custom_images_list_view_bloc_builder.dart';
import 'send_message_section.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AILoadingMessage(),
        Expanded(child: ChatListView()),
        CustomImagesListViewBlocBuilder(),
        SendMessageSection(),
      ],
    );
  }
}
