import 'package:flutter/material.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/chat_history.dart';

import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            CustomDrawerHeader(),
            Divider(),
            Expanded(child: SizedBox(child: ChatHistory())),
          ],
        ),
      ),
    );
  }
}
