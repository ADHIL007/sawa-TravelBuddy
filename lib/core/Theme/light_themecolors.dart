import 'package:flutter/material.dart';
import 'package:sawa/core/Theme/theme_abstract.dart';

class LightThemeColors extends ThemeColors {
  @override
  Color get primaryColor => Colors.blue;

  @override
  Color get accentColor => Colors.blueAccent;

  @override
  Color get scaffoldBackgroundColor => Colors.white;

  @override
  Color get textColor => Colors.black;
}