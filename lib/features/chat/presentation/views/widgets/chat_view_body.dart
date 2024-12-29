import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ai_app/features/chat/presentation/manager/chating_cubit.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/chat_list_view.dart';
import '../../manager/chating_state.dart';
import 'ai_loading_message.dart';
import 'custom_images_list_view_bloc_builder.dart';
import 'send_message_section.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: ChatListView()),
        const AILoadingMessage(),
        const CustomImagesListViewBlocBuilder(),
        BlocBuilder<ChatingCubit, ChatingState>(
          builder: (context, state) {
            return Text(
              context.read<ChatingCubit>().currentChatHistoryId!.chatHistoryId,
            );
          },
        ),
        const SendMessageSection(),
      ],
    );
  }
}
