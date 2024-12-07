import 'package:flutter/material.dart';
import '../../../../../core/utils/app_images.dart';
import 'chat_logo.dart';
import 'send_message_section.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //ToDo :chat list view
        Expanded(child: SizedBox()),
        ChatLogo(logo: AppImages.logoChat),
        SendMessageSection(),
      ],
    );
  }
}
