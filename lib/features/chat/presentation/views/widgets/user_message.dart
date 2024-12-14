import 'package:flutter/material.dart';
import 'package:open_ai_app/core/utils/app_images.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/chat_logo.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/message_container.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({super.key, required this.message, required this.dateTime});
  final String message;
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MessageContainer(
            message: message,
            dateTime: dateTime,
            color: Theme.of(context).colorScheme.onSurface,
            textColor: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 12),
          const ChatLogo(logo: AppImages.user),
        ],
      ),
    );
  }
}
