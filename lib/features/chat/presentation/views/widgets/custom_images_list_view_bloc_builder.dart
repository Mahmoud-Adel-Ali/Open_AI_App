import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/chatting_cubit.dart';
import '../../manager/chatting_state.dart';
import 'custom_images_list_view.dart';

class CustomImagesListViewBlocBuilder extends StatelessWidget {
  const CustomImagesListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChattingCubit, ChattingState>(
      builder: (context, state) {
        return CustomImagesListView(
            images: context.read<ChattingCubit>().imagesList);
      },
    );
  }
}
