import 'package:{{project_name.snakeCase()}}/constants.dart';
import 'package:{{project_name.snakeCase()}}/theme/color_theme.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class CombinedTheme {
  static ThemeData theme(Brightness brightness) {
    AppColorScheme myColorScheme = brightness == Brightness.dark
        ? AppColorScheme.dark()
        : AppColorScheme.light();

    double elevation(Set<MaterialState> states) {
      const Set<MaterialState> matchedStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.disabled,
      };
      return states.any(matchedStates.contains) ? 0 : kElevationDisabled;
    }

    Color? overlayColor(Set<MaterialState> states) {
      const Set<MaterialState> matchedStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return states.any(matchedStates.contains)
          ? myColorScheme.buttonPressed
          : null;
    }

    Color backgroundColor(Set<MaterialState> states) {
      return states.contains(MaterialState.disabled)
          ? myColorScheme.buttonDisabled
          : myColorScheme.primary;
    }

    Color? buttonBackgroundColor(Set<MaterialState> states) {
      const Set<MaterialState> matchedStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return states.any(matchedStates.contains)
          ? myColorScheme.buttonPressed
          : null;
    }

    BorderSide elevatedButtonSide(Set<MaterialState> states) {
      const Set<MaterialState> matchedStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      return BorderSide(
        width: 2.0,
        color: states.contains(MaterialState.disabled)
            ? myColorScheme.buttonDisabled
            : states.any(matchedStates.contains)
                ? myColorScheme.buttonPressed
                : myColorScheme.primaryContainer,
      );
    }

    BorderSide outlinedButtonSide(Set<MaterialState> states) {
      const Set<MaterialState> matchedStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      return BorderSide(
        width: 2.0,
        color: states.contains(MaterialState.disabled)
            ? myColorScheme.primary.withOpacity(0.4)
            : states.any(matchedStates.contains)
                ? myColorScheme.buttonPressed
                : myColorScheme.primaryContainer,
      );
    }

    Color elevatedBtnForegroundColor(Set<MaterialState> states) =>
        states.contains(MaterialState.disabled)
            ? myColorScheme.buttonOnDisabled
            : myColorScheme.buttonOnElevation;

    EdgeInsets buttonPadding(_) =>
        const EdgeInsets.symmetric(horizontal: 39.5, vertical: 12);

    Size buttonMinimumSize(_) => const Size(200, 50);

    RoundedRectangleBorder buttonShape(_) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadiusCircularBig));

    TextStyle buttonTextStyle(Set<MaterialState> states) => TextStyle(
          color: states.contains(MaterialState.disabled)
              ? myColorScheme.buttonOnDisabled
              : myColorScheme.primaryContainer,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          fontFamily: kFontPrimaryFamily,
          height: 1.5,
          letterSpacing: -0.01,
        );

    TextStyle textButtonTextStyle(Set<MaterialState> states) {
      return TextStyle(
        color: states.contains(MaterialState.disabled)
            ? myColorScheme.buttonOnDisabled
            : myColorScheme.buttonDisabled,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        letterSpacing: 0.06,
        height: 1.56,
      );
    }

    EdgeInsets textButtonPadding(_) =>
        const EdgeInsets.symmetric(horizontal: 24, vertical: 16);

    Color buttonForegroundColor(Set<MaterialState> states) {
      const Set<MaterialState> matchedStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return states.any(matchedStates.contains)
          ? myColorScheme.onPrimary
          : myColorScheme.primaryContainer;
    }

    Color textButtonForegroundColor(Set<MaterialState> states) {
      const Set<MaterialState> matchedStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return states.any(matchedStates.contains)
          ? myColorScheme.primaryContainer.withOpacity(0.75)
          : myColorScheme.primaryContainer;
    }

    return ThemeData(
        primaryColor: myColorScheme.primary,
        primaryColorDark: myColorScheme.onBackground300,
        scaffoldBackgroundColor: myColorScheme.scaffoldBackgroundColor,
        dividerColor: myColorScheme.divider,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: kFontPrimaryFamily,
        useMaterial3: true,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: myColorScheme.surface,
        ),
        appBarTheme: AppBarTheme(
            color: myColorScheme.scaffoldBackgroundColor,
            titleTextStyle: TextStyle(
              fontSize: 20.0,
              letterSpacing: 0.38,
              height: 1.25,
              fontWeight: FontWeight.w500,
              color: myColorScheme.onBackground900,
            )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(buttonTextStyle),
            shape: MaterialStateProperty.resolveWith(buttonShape),
            side: MaterialStateProperty.resolveWith(elevatedButtonSide),
            elevation: MaterialStateProperty.resolveWith(elevation),
            padding: MaterialStateProperty.resolveWith(buttonPadding),
            overlayColor: MaterialStateProperty.resolveWith(overlayColor),
            backgroundColor: MaterialStateProperty.resolveWith(backgroundColor),
            foregroundColor:
                MaterialStateProperty.resolveWith(elevatedBtnForegroundColor),
            minimumSize: MaterialStateProperty.resolveWith(buttonMinimumSize),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(buttonTextStyle),
            shape: MaterialStateProperty.resolveWith(buttonShape),
            side: MaterialStateProperty.resolveWith(outlinedButtonSide),
            padding: MaterialStateProperty.resolveWith(buttonPadding),
            minimumSize: MaterialStateProperty.resolveWith(buttonMinimumSize),
            foregroundColor:
                MaterialStateProperty.resolveWith(buttonForegroundColor),
            backgroundColor:
                MaterialStateProperty.resolveWith(buttonBackgroundColor),
            overlayColor: MaterialStateProperty.resolveWith(overlayColor),
          ),
        ),
        iconTheme: IconThemeData(color: myColorScheme.onBackground400),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
                color: myColorScheme.onBackground400,
                fontFamily: kFontPrimaryFamily),
            hintStyle: TextStyle(
              fontSize: 16.0,
              letterSpacing: 0.06,
              height: 1.56,
              fontWeight: FontWeight.w400,
              color: myColorScheme.onBackground200,
            ),
            prefixStyle: TextStyle(
                color: myColorScheme.onBackground,
                fontFamily: kFontPrimaryFamily),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            fillColor: myColorScheme.background),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(textButtonTextStyle),
            padding: MaterialStateProperty.resolveWith(textButtonPadding),
            overlayColor:
                MaterialStateProperty.resolveWith((_) => Colors.transparent),
            shape: MaterialStateProperty.resolveWith(buttonShape),
            backgroundColor:
                MaterialStateProperty.resolveWith((_) => Colors.transparent),
            foregroundColor: MaterialStateProperty.resolveWith(
              textButtonForegroundColor,
            ),
            minimumSize:
                MaterialStateProperty.resolveWith((_) => const Size(100, 50)),
          ),
        ),
        textTheme: TextTheme(
          displayMedium: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.w400, height: 1.2),
          displaySmall: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              height: 1.2,
              letterSpacing: -0.03),
          headlineMedium: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            height: 1.3,
            letterSpacing: -0.41,
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.3,
            letterSpacing: -0.03,
            color: myColorScheme.onBackground,
          ),
          titleLarge: TextStyle(
            fontSize: 20.0,
            letterSpacing: 0.38,
            height: 1.25,
            fontWeight: FontWeight.w500,
            color: myColorScheme.onBackground900,
          ),
          labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: myColorScheme.primary,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 1.5,
            letterSpacing: -0.03,
            color: myColorScheme.onBackground500,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 1.5,
            letterSpacing: -0.03,
            color: myColorScheme.onBackground500,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 17,
            height: 1.3,
            letterSpacing: -0.41,
            color: myColorScheme.onBackground900,
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 1.3,
            letterSpacing: -0.41,
            color: myColorScheme.onBackground,
          ),
          labelMedium: TextStyle(
            fontFamily: "Inter",
            fontSize: 16.0,
            letterSpacing: 0.06,
            height: 1.56,
            fontWeight: FontWeight.w600,
            color: myColorScheme.onBackground900,
          ),
          titleMedium: TextStyle(
            fontSize: 16.0,
            letterSpacing: 0.06,
            height: 1.56,
            fontWeight: FontWeight.w400,
            color: myColorScheme.onBackground800,
          ),
        ).apply(
          displayColor: myColorScheme.onBackground,
          fontFamily: kFontPrimaryFamily,
          fontSizeFactor: AppTheme.textScaleFactor,
        ),
        cardTheme: CardTheme(
          elevation: 10,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusCircularBig),
          ),
        ),
        dialogTheme: DialogTheme(
          contentTextStyle: TextStyle(
            fontSize: 14.0,
            color: myColorScheme.onBackground700,
          ),
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: myColorScheme.onBackground700,
          ),
          backgroundColor: myColorScheme.onBackground50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        sliderTheme: SliderThemeData(
            valueIndicatorTextStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              height: 1.3,
              color: myColorScheme.onBackground600,
              letterSpacing: -0.03,
            ),
            showValueIndicator: ShowValueIndicator.always),
        chipTheme: ChipThemeData(
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
                side: BorderSide.none, borderRadius: BorderRadius.circular(8))),
        colorScheme: myColorScheme);
  }
}
