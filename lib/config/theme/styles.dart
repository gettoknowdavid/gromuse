import 'package:flutter/material.dart';
import 'package:gromuse/common/assets/fonts.gen.dart';

class GTextStyle extends TextStyle {
  const GTextStyle._({
    super.fontSize,
    super.fontWeight,
    super.fontFamily,
    super.textBaseline,
    super.letterSpacing,
  });

  static const String _fontFamily = FontFamily.helveticaNeue;

  static const display = GTextStyle._(
    fontSize: 32.0,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading1Light = GTextStyle._(
    fontSize: 24.0,
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading1Medium = GTextStyle._(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading1Bold = GTextStyle._(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading2Light = GTextStyle._(
    fontSize: 18.0,
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading2Medium = GTextStyle._(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const heading2Bold = GTextStyle._(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const bodyLight = GTextStyle._(
    fontSize: 14.0,
    fontWeight: FontWeight.w200,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const bodyMedium = GTextStyle._(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const bodyBold = GTextStyle._(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const caption = GTextStyle._(
    fontSize: 9.0,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );

  static const label = GTextStyle._(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0,
  );
}
