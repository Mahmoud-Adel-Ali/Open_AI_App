import 'package:flutter/material.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/add_new_conversation_button.dart';

import '../../../../../core/widgets/custom_change_theme_mode_icon.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomChangeThemeModeIcon(),
          AddNewConversationButton(),
        ],
      ),
    );
  }
}
