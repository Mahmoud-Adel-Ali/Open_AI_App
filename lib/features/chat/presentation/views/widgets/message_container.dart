import 'package:flutter/material.dart';

import '../../../../../core/utils/styless.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        message,
        style: Styless.textSimeBold14,
      ),
    );
  }
}
