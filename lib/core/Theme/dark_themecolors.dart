// lib/core/theme/dark_theme_colors.dart
import 'package:flutter/material.dart';
import 'package:sawa/core/Theme/theme_abstract.dart';


class DarkThemeColors extends ThemeColors {
  @override
  Color get primaryColor => Colors.deepPurple;

  @override
  Color get accentColor => Colors.teal;

  @override
  Color get scaffoldBackgroundColor => Colors.black;

  @override
  Color get textColor => Colors.white;
}
