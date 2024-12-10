import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ai_app/features/chat/presentation/manager/chating_cubit.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/custom_images_list_view.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/user_message.dart';
import '../../manager/chating_state.dart';
import 'ai_loading_message.dart';
import 'ai_message.dart';
import 'send_message_section.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //ToDo :chat list view
        // Ex
        const AIMessage(
          message:
              "message message message message message message message message message",
        ),
        const UserMessage(message: 'User Message'),
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
