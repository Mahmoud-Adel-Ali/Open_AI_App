import 'package:flutter/material.dart';
import 'package:open_ai_app/core/utils/styless.dart';
import 'widgets/chat_view_body.dart';
import 'widgets/custom_drawer.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: chatViewAppBar(),
      body: const ChatViewBody(),
    );
  }

  AppBar chatViewAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('AI Chat', style: Styless.textMedium20),
      leading: IconButton(
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
