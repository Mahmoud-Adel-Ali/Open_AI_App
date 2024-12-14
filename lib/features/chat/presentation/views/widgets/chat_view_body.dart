import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/chating_cubit.dart';
import '../../manager/chating_state.dart';
import 'ai_loading_message.dart';
import 'ai_message.dart';
import 'custom_images_list_view.dart';
import 'send_message_section.dart';
import 'user_message.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //ToDo :chat list view
        // Ex
        AIMessage(
          dateTime: DateTime.now(),
          message:
              "message message message message message message message message message",
        ),
         UserMessage(message: 'User Message',
          dateTime: DateTime.now(),
        ),
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
