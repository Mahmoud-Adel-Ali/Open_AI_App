import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../custom_images_viewer_view.dart';
import 'chat_logo.dart';
import 'custom_selected_image_box.dart';
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
              CustomSavedImages(imagesUrls: imagesUrls),
              const SizedBox(height: 2),
              MessageContainer(
                message: message,
                dateTime: dateTime,
                isUserMessage: true,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
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

class CustomSavedImages extends StatelessWidget {
  const CustomSavedImages({super.key, this.imagesUrls});
  final List<String>? imagesUrls;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        imagesUrls != null && imagesUrls!.isNotEmpty
            ? SizedBox(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to custom image viewer view
                    // with the list of images
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 800),
                        // Handles popping animation
                        //3️⃣ Flip (3D Rotation) Animation
                        reverseTransitionDuration:
                            const Duration(milliseconds: 800),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            CustomImagesViewerView(imagesUrls: imagesUrls!),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return AnimatedBuilder(
                            animation: animation,
                            builder: (context, child) {
                              final double rotateValue =
                                  animation.value * 3.14 * 2;
                              // Convert to radians
                              return Transform(
                                transform: Matrix4.rotationY(rotateValue),
                                alignment: Alignment.center,
                                child: child,
                              );
                            },
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      CustomSelectedImageBox(
                        path: imagesUrls![0],
                        width: 70,
                      ),
                      imagesUrls!.length > 1
                          ? Positioned(
                              top: 15,
                              left: 15,
                              child: Text(
                                "+${(imagesUrls!.length - 1).toString()}",
                                style: TextStyle(
                                    color: Colors.blue[900], fontSize: 32),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
