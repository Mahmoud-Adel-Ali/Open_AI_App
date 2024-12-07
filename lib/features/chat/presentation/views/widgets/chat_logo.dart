import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ChatLogo extends StatelessWidget {
  const ChatLogo({
    super.key,
    required this.logo,
  });
  final String logo;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.mainColor,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(logo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
