
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class UserControls {
  static final UserControls _instance = UserControls._internal();

  bool _isDarkMode = false;


  UserControls._internal();


  static UserControls get instance => _instance;


  bool get isDarkMode => _isDarkMode;

  

  
  Future<void> setThemeMode(bool isDark) async {
    _isDarkMode = isDark;
    await _saveThemeToPrefs();
  }

  
  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
  }



  
  Future<void> _saveThemeToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  

  
  Future<void> _clearThemePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isDarkMode');
  }
}
