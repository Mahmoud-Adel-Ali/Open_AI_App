import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'core/theme/theme_state.dart';
import 'features/chat/presentation/manager/chating_cubit.dart';
import 'features/splash/presentation/view/splash_view.dart';

class OpenAiApp extends StatelessWidget {
  const OpenAiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit()..getTheme(),
        ),
        BlocProvider<ChatingCubit>(
          create: (context) => ChatingCubit()
            ..getChatHistoryIds()
            ..openLastChatRoom(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: context.read<ThemeCubit>().isDarkTheme
                  ? AppTheme.darkTheme
                  : AppTheme.lightTheme,
              home: const SplashView(),
            ),
          );
        },
      ),
    );
  }
}
