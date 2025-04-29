import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sawa/core/Theme/theme_abstract.dart';
import 'package:sawa/core/Theme/themeprovider.dart'; // Your theme provider
import 'package:sawa/core/global/user_controls.dart';
import 'package:sawa/widgets/bottom_navigation.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserControls.instance.loadFromPrefs();  

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(), 
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(themeProvider.lighttheme),
      darkTheme: _buildThemeData(themeProvider.darktheme),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const BottomNavigationWrapper(),
    );
  }

  ThemeData _buildThemeData(ThemeColors themeColors) {
    return ThemeData(
      primaryColor: themeColors.primaryColor,
      scaffoldBackgroundColor: themeColors.scaffoldBackgroundColor,
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: themeColors.textColor),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: themeColors.accentColor),
    );
  }
}