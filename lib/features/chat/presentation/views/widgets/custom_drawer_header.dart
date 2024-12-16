import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_change_theme_mode_icon.dart';
import 'add_new_conversation_button.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
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
