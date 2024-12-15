import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ai_app/features/chat/data/models/chat_model.dart';
import '../../manager/chating_cubit.dart';
import '../../manager/chating_state.dart';
import 'ai_loading_message.dart';
import 'chat_list_view_item.dart';
import 'custom_images_list_view.dart';
import 'send_message_section.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //ToDo :chat list view
        ChatListViewItem(
            chatModel: ChatModel(
          chatId: '',
          message: 'message user ya pash',
          response: 'response ai ya gale',
          imagesUrls: [],
          dateTime: DateTime.now(),
        )),
        const AILoadingMessage(),
        const Expanded(child: SizedBox()),
        BlocBuilder<ChatingCubit, ChatingState>(
          builder: (context, state) {
            return CustomImagesListView(
                images: context.read<ChatingCubit>().imagesList);
          },
        ),
        const SendMessageSection(),
      ],
    );
  }
}
