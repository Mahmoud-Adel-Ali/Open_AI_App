import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styless.dart';
import '../../../data/models/chat_history_id_model.dart';
import '../../manager/chatting_cubit.dart';
import 'custom_dialog.dart';

class ChatHistoryItem extends StatelessWidget {
  const ChatHistoryItem({
    super.key,
    required this.chatHistoryIdModel,
  });

  final ChatHistoryIdModel chatHistoryIdModel;

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
            chatHistoryIdModel.chatName ?? chatHistoryIdModel.chatHistoryId,
            style: Styless.textSimeBold18,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(chatHistoryIdModel.dateTime.toString()),
          trailing: IconButton(
            onPressed: () {
              _showMoreOptionsDialog(context);
            },
            icon: const Icon(Icons.more_vert),
          ),
          onTap: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) {
                return CustomDialog(
                  description:
                      'Are you sure you want to close current chat page and open other conversation? 🙂',
                  onTapYes: () {
                    context
                        .read<ChattingCubit>()
                        .openChatRoom(chatHistoryIdModel);
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
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
              onPressed: () {
                context
                    .read<ChattingCubit>()
                    .deleteChatRoom(chatHistoryIdModel);
                Navigator.pop(context);
              },
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
