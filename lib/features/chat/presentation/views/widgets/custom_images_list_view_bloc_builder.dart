import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/chating_cubit.dart';
import '../../manager/chating_state.dart';
import 'custom_images_list_view.dart';

class CustomImagesListViewBlocBuilder extends StatelessWidget {
  const CustomImagesListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatingCubit, ChatingState>(
      builder: (context, state) {
        return CustomImagesListView(
            images: context.read<ChatingCubit>().imagesList);
      },
    );
  }
}
