import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ai_app/features/chat/presentation/manager/chating_cubit.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/chat_list_view_item.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/custom_loading_section.dart';

import '../../../data/models/chat_model.dart';
import '../../manager/chating_state.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatingCubit, ChatingState>(
      builder: (context, state) {
        List<ChatModel> items = context.read<ChatingCubit>().currentChat;
        return CustomScrollView(
          slivers: [
            SliverList.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ChatListViewItem(
                  chatModel: items[index],
                );
              },
            ),
            state is SendMessageToAiLoading
                ? const SliverFillRemaining(child: CustomLoadingSection())
                : const SliverToBoxAdapter(),
          ],
        );
      },
    );
  }
}
