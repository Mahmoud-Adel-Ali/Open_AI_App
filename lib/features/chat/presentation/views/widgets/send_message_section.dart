import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/chatting_cubit.dart';
import 'custom_text_form_field.dart';
import 'pick_image_icon.dart';

class SendMessageSection extends StatelessWidget {
  const SendMessageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const PickImageIcon(),
          const SizedBox(width: 12),
          Expanded(
            child: CustomTextFormField(
              controller: context.read<ChattingCubit>().chatTextField,
              hintTxt: 'Type your message here...',
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return null;
                } else if (checkEmptyText(text)) {
                  return 'I need some information to help you';
                }
                return null;
              },
              suffix: IconButton(
                onPressed: () {
                  String text = context.read<ChattingCubit>().chatTextField.text;
                  if (text.isNotEmpty && !checkEmptyText(text)) {
                    context.read<ChattingCubit>().prepareConversation();
                  }
                },
                icon: const Icon(Icons.send_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool checkEmptyText(String text) => RegExp(r'^[ \n]*$').hasMatch(text);
}
