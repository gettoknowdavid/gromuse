import 'package:flutter/material.dart';

import 'colors.dart';
import 'internal.dart';

export 'styles.dart';

class GTheme {
  static ThemeData get dark => _createTheme(Brightness.dark);

  static ThemeData get light => _createTheme(Brightness.light);

  GTheme._();

  static ThemeData _createTheme(Brightness brightness) => _raw(brightness);

  static ThemeData _raw(Brightness brightness) {
    final isLight = brightness == Brightness.light;

    return ThemeData(
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: Internal.r(isLight, GColors.primary, GColors.primaryDark),
        onPrimary: Internal.r(isLight, GColors.white, GColors.text),
        secondary:
            Internal.r(isLight, GColors.secondary, GColors.secondaryDark),
        onSecondary: Internal.r(isLight, GColors.text, GColors.white),
        error: Internal.r(isLight, GColors.error, GColors.onError),
        onError: Internal.r(isLight, GColors.onError, GColors.error),
        background: Internal.r(isLight, GColors.white, GColors.dark),
        onBackground: Internal.r(isLight, GColors.text, GColors.white),
        surface: Internal.r(isLight, GColors.white, GColors.dark),
        onSurface: Internal.r(isLight, GColors.text, GColors.white),
      ),
    );
  }
}
