import 'package:flutter/material.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/custom_selected_image_box.dart';
import '../../../../../core/utils/app_images.dart';
import 'chat_logo.dart';
import 'message_container.dart';

class UserMessage extends StatelessWidget {
  const UserMessage(
      {super.key,
      required this.message,
      required this.dateTime,
      this.imagesUrls});
  final String message;
  final DateTime dateTime;
  final List<String>? imagesUrls;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              imagesUrls != null
                  ? SizedBox(
                      height: 70,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imagesUrls?.length ?? 0,
                        itemBuilder: (context, index) {
                          return CustomSelectedImageBox(
                            path: imagesUrls![index],
                            width: 70,
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 2),
              MessageContainer(
                message: message,
                dateTime: dateTime,
                color: Theme.of(context).colorScheme.onSurface,
                textColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(width: 12),
          const ChatLogo(logo: AppImages.user),
        ],
      ),
    );
  }
}
