import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../core/utils/app_images.dart';
import 'chat_logo.dart';

class AILoadingMessage extends StatelessWidget {
  const AILoadingMessage({
    super.key,
  });
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
          SizedBox(
            width: 50.w,
            child: SpinKitThreeInOut(
              color: Theme.of(context).colorScheme.onSecondary,
              size: 20.0.sp,
            ),
          ),
        ],
      ),
    );
  }
}
