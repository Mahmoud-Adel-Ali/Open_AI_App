import 'package:flutter/material.dart';
import 'package:open_ai_app/core/utils/styless.dart';

class ChatHistoryHeader extends StatelessWidget {
  const ChatHistoryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          'Chat History',
          style: Styless.textBold24
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
