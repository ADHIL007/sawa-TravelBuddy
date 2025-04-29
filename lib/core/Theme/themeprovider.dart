import 'package:flutter/material.dart';
import 'package:sawa/core/Theme/dark_themecolors.dart';
import 'package:sawa/core/Theme/light_themecolors.dart';
import 'package:sawa/core/Theme/theme_abstract.dart';
import 'package:sawa/core/global/user_controls.dart';

class ThemeProvider with ChangeNotifier {
  ThemeColors _currentTheme;
  final ThemeColors _lighttheme;
  final ThemeColors _darktheme;

  ThemeProvider()
      : _currentTheme = UserControls.instance.isDarkMode ? DarkThemeColors() : LightThemeColors(),
        _lighttheme = LightThemeColors(),
        _darktheme = DarkThemeColors();

  ThemeColors get currentTheme => _currentTheme;
  ThemeColors get lighttheme => _lighttheme;
  ThemeColors get darktheme => _darktheme;

  bool get isDarkMode => _currentTheme is DarkThemeColors;

  void toggleTheme() {
    _currentTheme = (_currentTheme is DarkThemeColors) ? LightThemeColors() : DarkThemeColors();
    UserControls.instance.setThemeMode(_currentTheme is DarkThemeColors);
    notifyListeners();
  }
}
