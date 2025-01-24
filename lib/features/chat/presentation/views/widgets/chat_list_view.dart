import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/chat_model.dart';
import '../../manager/chating_cubit.dart';
import '../../manager/chating_state.dart';
import 'chat_list_view_item.dart';
import 'custom_loading_section.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatingCubit, ChatingState>(
      builder: (context, state) {
        List<ChatModel> items = context.read<ChatingCubit>().currentChat;
        if (items.isNotEmpty) {
          _scrollToBottom();
        }
        return CustomScrollView(
          controller: _scrollController,
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
                ? const SliverToBoxAdapter(child: CustomLoadingSection())
                : const SliverToBoxAdapter(),
          ],
        );
      },
    );
  }
}
