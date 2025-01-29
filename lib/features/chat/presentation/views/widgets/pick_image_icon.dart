import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/chatting_cubit.dart';

class PickImageIcon extends StatefulWidget {
  const PickImageIcon({
    super.key,
  });

  @override
  State<PickImageIcon> createState() => _PickImageIconState();
}

class _PickImageIconState extends State<PickImageIcon> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      child: IconButton(
        onPressed: isActive
            ? () {}
            : () {
                isActive = true;
                setState(() {});
                context.read<ChattingCubit>().pickImages().then(
                  (value) {
                    isActive = false;
                    setState(() {});
                  },
                );
              },
        icon: const Icon(Icons.add_photo_alternate),
      ),
    );
  }
}
