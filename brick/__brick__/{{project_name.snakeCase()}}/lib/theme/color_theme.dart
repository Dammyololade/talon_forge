import 'package:{{project_name.snakeCase()}}/constants.dart';
import 'package:flutter/material.dart';


class AppColorScheme extends ColorScheme {
  const AppColorScheme({
    required super.primary,
    required primaryVariant,
    required super.secondary,
    required secondaryVariant,
    required super.surface,
    required super.background,
    required super.error,
    required super.onPrimary,
    required super.onSecondary,
    required super.onSurface,
    required super.onBackground,
    required super.onError,
    required super.brightness,
    required this.scaffoldBackgroundColor,
    required this.onBackground50,
    required this.onBackground100,
    required this.onBackground200,
    required this.onBackground300,
    required this.onBackground400,
    required this.onBackground500,
    required this.onBackground600,
    required this.onBackground700,
    required this.onBackground800,
    required this.onBackground900,
    required this.successLight,
    required this.success,
    required this.onSuccess,
    required this.actionRequired,
    required this.onActionRequired,
    required this.disabled,
    required this.onDisabled,
    required this.inactiveComponent,
    required this.onInactiveComponent,
    required this.trash,
    required this.modalBarrier,
    required this.infoBox,
    required this.divider,
    required this.shadow,
    required this.slider,
    required this.onSlider,
    required this.buttonPressed,
    required this.buttonOnPressed,
    required this.buttonDisabled,
    required this.buttonOnDisabled,
    required this.buttonOnElevation,
  }) : super(
          primaryContainer: primaryVariant,
          secondaryContainer: secondaryVariant,
        );

  // Typography
  final Color onBackground50;
  final Color onBackground100;
  final Color onBackground200;
  final Color onBackground300;
  final Color onBackground400;
  final Color onBackground500;
  final Color onBackground600;
  final Color onBackground700;
  final Color onBackground800;
  final Color onBackground900;

  // Statuses
  final Color successLight;
  final Color success;
  final Color onSuccess;
  final Color actionRequired;
  final Color onActionRequired;
  final Color disabled;
  final Color onDisabled;

  // Design component
  final Color inactiveComponent;
  final Color onInactiveComponent;

  //Buttons
  final Color buttonPressed;
  final Color buttonOnPressed;
  final Color buttonDisabled;
  final Color buttonOnDisabled;
  final Color buttonOnElevation;

  // Other elements
  final Color modalBarrier;
  final Color infoBox;
  final Color divider;
  final Color scaffoldBackgroundColor;
  @override
  final Color shadow;
  final Color slider;
  final Color onSlider;
  final Color trash;

  factory AppColorScheme.light() => const AppColorScheme(
        primary: kColorPrimary,
        primaryVariant: kColorPrimary,
        onPrimary: kColorWhite,
        secondary: kColorSecondaryLight,
        secondaryVariant: kColorPrimary,
        onSecondary: kColorWhite,
        surface: kLightBackground,
        onSurface: kColorBlack,
        background: kLightBackground,
        onBackground: kColorBlack,
        error: kColorError,
        trash: kColorError,
        onError: kColorWhite,
        brightness: Brightness.light,
        scaffoldBackgroundColor: kColorWhite,
        onBackground50: kColorShadesOfBlack50,
        onBackground100: kColorShadesOfBlack100,
        onBackground200: kColorShadesOfBlack200,
        onBackground300: kColorShadesOfBlack300,
        onBackground400: kColorShadesOfBlack400,
        onBackground500: kColorShadesOfBlack500,
        onBackground600: kColorShadesOfBlack600,
        onBackground700: kColorShadesOfBlack700,
        onBackground800: kColorShadesOfBlack800,
        onBackground900: kColorShadesOfBlack900,
        success: kColorGoGreen,
        successLight: kColorGreenLight,
        onSuccess: kColorWhite,
        actionRequired: kColorPrimary,
        onActionRequired: kColorWhite,
        disabled: kColorShadesOfBlack400,
        onDisabled: kColorWhite,
        inactiveComponent: kColorShadesOfBlack100,
        onInactiveComponent: kColorWhite,
        modalBarrier: kColorShadesOfBlack800,
        infoBox: kColorShadesOfBlack50,
        divider: kColorShadesOfBlack100,
        shadow: kColorShadesOfBlack400,
        slider: kColorShadesOfBlack50,
        onSlider: kColorShadesOfBlack300,
        buttonPressed: kColorSecondaryLight,
        buttonOnPressed: kColorWhite,
        buttonDisabled: kColorPrimaryTintLight,
        buttonOnDisabled: kColorWhite,
        buttonOnElevation: kColorWhite,
      );

  factory AppColorScheme.dark() => const AppColorScheme(
        primary: kColorPrimary,
        primaryVariant: kColorPrimary,
        onPrimary: kColorWhite,
        secondary: kColorSecondaryDark,
        secondaryVariant: kColorPrimary,
        onSecondary: kColorWhite,
        surface: kDarkSurface,
        onSurface: kColorWhite,
        background: kDarkBackground,
        onBackground: kColorWhite,
        error: kColorError,
        trash: kColorError,
        onError: kColorWhite,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kDarkBackground,
        onBackground50: kColorShadesOfBlack900,
        onBackground100: kColorShadesOfBlack800,
        onBackground200: kColorShadesOfBlack700,
        onBackground300: kColorShadesOfBlack600,
        onBackground400: kColorShadesOfBlack500,
        onBackground500: kColorShadesOfBlack400,
        onBackground600: kColorShadesOfBlack300,
        onBackground700: kColorShadesOfBlack200,
        onBackground800: kColorShadesOfBlack100,
        onBackground900: kColorWhite,
        success: kColorGoGreen,
        successLight: kColorGreenDark,
        onSuccess: kColorWhite,
        actionRequired: kColorPrimary,
        onActionRequired: kColorWhite,
        disabled: kColorShadesOfBlack400,
        onDisabled: kColorWhite,
        inactiveComponent: kColorShadesOfBlack500,
        onInactiveComponent: kColorWhite,
        modalBarrier: kColorBlack,
        infoBox: kColorShadesOfBlack700,
        divider: kColorShadesOfBlack100,
        shadow: kColorFullBlack,
        slider: kColorShadesOfBlack600,
        onSlider: kColorShadesOfBlack100,
        buttonPressed: kColorSecondaryDark,
        buttonOnPressed: kColorWhite,
        buttonDisabled: kColorPrimaryTintLight,
        buttonOnDisabled: kColorShadesOfBlack400,
        buttonOnElevation: kColorWhite,
      );
}
