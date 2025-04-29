import 'package:flutter/material.dart';
import 'package:sawa/core/global/user_controls.dart';
import 'package:provider/provider.dart';
import 'package:sawa/core/Theme/themeprovider.dart';
import 'package:sawa/screens/home/home_controls/locations_controls.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // Access the theme

    return SafeArea(
      child: Scaffold(
      backgroundColor: ThemeProvider().currentTheme.scaffoldBackgroundColor,
        body: Container(
          child: LocationSearch()
        ),
      ),
    );
  
  }
}
