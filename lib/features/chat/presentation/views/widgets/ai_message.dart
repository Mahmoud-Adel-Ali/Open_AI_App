import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import 'chat_logo.dart';
import 'message_container.dart';

class AIMessage extends StatelessWidget {
  const AIMessage({
    super.key,
    required this.message,
    required this.dateTime,
  });
  final String message;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chat Logo
          const ChatLogo(logo: AppImages.logoChat),
          const SizedBox(width: 12),
          // Message Container
          MessageContainer(
            message: message,
            dateTime: dateTime,
            isUserMessage: false,
          ),
        ],
      ),
    );
  }
}
