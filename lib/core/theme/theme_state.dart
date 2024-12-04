abstract class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ThemeIsChangedSuccessfuly extends ThemeState {
  final bool isDarkTheme;

  ThemeIsChangedSuccessfuly({required this.isDarkTheme});
}
