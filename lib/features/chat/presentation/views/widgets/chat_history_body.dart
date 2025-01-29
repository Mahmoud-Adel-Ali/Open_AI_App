import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/chatting_cubit.dart';
import '../../manager/chatting_state.dart';
import 'chat_history_item.dart';

class ChatHistoryBody extends StatelessWidget {
  const ChatHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChattingCubit, ChattingState>(
      builder: (context, state) {
        var items = context.read<ChattingCubit>().chatHistoryIds;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => ChatHistoryItem(
            chatHistoryIdModel: items[index],
          ),
        );
      },
    );
  }
}
