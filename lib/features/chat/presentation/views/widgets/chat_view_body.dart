import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ai_app/features/chat/presentation/views/widgets/chat_list_view.dart';
import '../../manager/chating_cubit.dart';
import '../../manager/chating_state.dart';
import 'ai_loading_message.dart';
import 'custom_images_list_view.dart';
import 'send_message_section.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AILoadingMessage(),
        const Expanded(child: ChatListView()),
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
