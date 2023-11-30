import 'package:{{project_name.snakeCase()}}/theme/app_theme.dart';
import 'package:flutter/material.dart';

abstract class ThemeState {
  late final Brightness brightness;

  ThemeData getThemeData();
}

class LightThemeState extends ThemeState {
  LightThemeState() {
    brightness = Brightness.light;
  }

  @override
  ThemeData getThemeData() => AppTheme.lightTheme;
}

class DarkThemeState extends ThemeState {
  DarkThemeState() {
    brightness = Brightness.dark;
  }

  @override
  ThemeData getThemeData() => AppTheme.darkTheme;
}

enum ThemeOption { light, dark }
