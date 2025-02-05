import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ai_app/core/widgets/toast_message.dart';

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
  /// A single item in the chat history list.
  ///
  /// This widget displays the chat name, date and time of the last message,
  /// and a more options icon.
  ///
  /// When the user taps on the item, the chat page is opened.
  ///
  /// If the chat is already open, the user is asked if they want to close the
  /// current chat page and open the other conversation.
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
            // If the chat name is null, use the chat history id as the title.
            chatHistoryIdModel.chatName ?? chatHistoryIdModel.chatHistoryId,
            style: Styless.textSemiBold18,
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
            if (context
                    .read<ChattingCubit>()
                    .currentChatHistoryId
                    ?.chatHistoryId !=
                chatHistoryIdModel.chatHistoryId) {
              // If the chat is not open, open the chat page.
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
            } else {
              // If the chat is already open, show a message to the user.
              showToastMessage(
                context,
                msg:
                    "This chat is open. Do you need a new chat or want to continue another one?",
                type: MessageType.info,
              );
            }
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
