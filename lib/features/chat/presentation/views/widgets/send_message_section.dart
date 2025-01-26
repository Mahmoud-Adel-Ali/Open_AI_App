import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/chating_cubit.dart';
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
              controller: context.read<ChatingCubit>().chatTextFeild,
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
                  String text = context.read<ChatingCubit>().chatTextFeild.text;
                  if (text.isNotEmpty && !checkEmptyText(text)) {
                    context.read<ChatingCubit>().sendMessageToAI();
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
