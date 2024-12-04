import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ai_app/constant.dart';
import 'package:open_ai_app/core/database/cache_helper.dart';
import 'package:open_ai_app/core/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool isDarkTheme = false;

  getTheme() {
    isDarkTheme = CacheHelper().getBoolean(Constant.themeMode) ?? false;
    emit(ThemeIsChangedSuccessfuly(isDarkTheme: isDarkTheme));
  }

  changeThem() {
    isDarkTheme = !isDarkTheme;
    CacheHelper().setBoolean(Constant.themeMode, isDarkTheme);
    emit(ThemeIsChangedSuccessfuly(isDarkTheme: isDarkTheme));
  }
}
