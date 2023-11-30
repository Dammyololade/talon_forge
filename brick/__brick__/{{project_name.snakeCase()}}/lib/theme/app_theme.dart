import 'package:{{project_name.snakeCase()}}/theme/color_theme.dart';
import 'package:{{project_name.snakeCase()}}/theme/combined_theme.dart';
import 'package:flutter/material.dart';

enum ButtonSize { big, small }

enum ButtonColor { primary, black }

enum IconPosition { right, left }

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => CombinedTheme.theme(Brightness.light);

  static ThemeData get darkTheme => CombinedTheme.theme(Brightness.dark);

  static double textScaleFactor = 1;

  static setTextScaleFactor(double newTextScaleFactor) {
    textScaleFactor = newTextScaleFactor;
  }
}

extension ThemeExt on Theme {

  AppColorScheme get appColorScheme => data.colorScheme as AppColorScheme;
}

extension TextThemeX on TextTheme {

}
