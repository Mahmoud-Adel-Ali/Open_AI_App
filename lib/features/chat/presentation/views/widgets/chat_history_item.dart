import 'package:flutter/material.dart';
import '../../../../../core/utils/styless.dart';

class ChatHistoryItem extends StatelessWidget {
  const ChatHistoryItem({
    super.key,
    required this.chatName,
    required this.date,
    this.onPressedOnDelete,
    this.onPressedItem,
  });

  final String chatName;
  final String date;
  final Function()? onPressedOnDelete;
  final Function()? onPressedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          title: Text(
            chatName,
            style: Styless.textSimeBold18,
          ),
          subtitle: Text('$date ...'),
          trailing: IconButton(
            onPressed: () {
              _showMoreOptionsDialog(context);
            },
            icon: const Icon(Icons.more_vert),
          ),
          onTap: onPressedItem,
        ),
      ),
    );
  }

  void _showMoreOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          children: [
            SimpleDialogOption(
              onPressed: onPressedOnDelete,
              child: const Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Delete',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
