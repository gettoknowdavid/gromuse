import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/common/common.dart';
import 'package:gromuse/config/config.dart';

export 'colors.dart';
export 'internal.dart';
export 'styles.dart';

class GTheme {
  static ThemeData get dark => _createTheme(Brightness.dark);

  static ThemeData get light => _createTheme(Brightness.light);

  GTheme._();

  static ThemeData _createTheme(Brightness brightness) => _raw(brightness);

  static Size filledButtonSize = Size.fromHeight(40.h);

  static ThemeData _raw(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    final colorScheme = _colorScheme(brightness, isLight);

    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: FontFamily.helveticaNeue,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: GColors.text,
        selectedItemColor: GColors.text,
        backgroundColor: GColors.white,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          minimumSize: filledButtonSize,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: GTextStyle.caption,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2).r,
        ),
      ),
    );
  }

  static ColorScheme _colorScheme(Brightness brightness, bool isLight) {
    return ColorScheme(
      brightness: brightness,
      primary: Internal.r(isLight, GColors.primary, GColors.primaryDark),
      onPrimary: Internal.r(isLight, GColors.white, GColors.text),
      secondary: Internal.r(isLight, GColors.secondary, GColors.secondaryDark),
      onSecondary: Internal.r(isLight, GColors.text, GColors.white),
      error: Internal.r(isLight, GColors.error, GColors.onError),
      onError: Internal.r(isLight, GColors.onError, GColors.error),
      background: Internal.r(isLight, GColors.background, GColors.dark),
      onBackground: Internal.r(isLight, GColors.text, GColors.white),
      surface: Internal.r(isLight, GColors.white, GColors.dark),
      onSurface: Internal.r(isLight, GColors.text, GColors.white),
    );
  }
}
