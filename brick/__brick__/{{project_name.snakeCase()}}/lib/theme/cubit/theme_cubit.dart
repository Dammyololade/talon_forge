import 'package:{{project_name.snakeCase()}}/database/session_manager.dart';
import 'package:{{project_name.snakeCase()}}/theme/cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(SessionManager().theme == ThemeOption.light.name
            ? LightThemeState()
            : DarkThemeState());

  void toggleTheme() {
    final themeOption = SessionManager().theme == ThemeOption.light.name
        ? ThemeOption.dark
        : ThemeOption.light;
    changeTheme(themeOption);
  }

  Future<void> changeTheme(ThemeOption option) async {
    SessionManager().theme = option.name;
    emit(deriveThemeFromOption(option));
  }

  ThemeState deriveThemeFromOption(ThemeOption option) => switch (option) {
        ThemeOption.light => LightThemeState(),
        ThemeOption.dark => DarkThemeState(),
      };
}
