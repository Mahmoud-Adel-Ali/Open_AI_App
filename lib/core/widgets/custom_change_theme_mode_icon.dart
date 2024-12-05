import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_ai_app/core/theme/theme_cubit.dart';
import 'package:open_ai_app/core/theme/theme_state.dart';

class CustomChangeThemeModeIcon extends StatelessWidget {
  const CustomChangeThemeModeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(24),
          ),
          child: InkWell(
            onTap: () {
              context.read<ThemeCubit>().changeThem();
            },
            child: context.read<ThemeCubit>().isDarkTheme
                ? SvgPicture.asset('assets/icons/light_mode.svg')
                : SvgPicture.asset('assets/icons/dark_mode.svg'),
          ),
        );
      },
    );
  }
}
