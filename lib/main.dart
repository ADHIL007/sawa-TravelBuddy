import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sawa/core/Routes/routes.dart';
import 'package:sawa/core/Theme/theme_abstract.dart';
import 'package:sawa/core/Theme/themeprovider.dart';
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
      initialRoute: Routes.home,
      routes: Routes.getRoutes(),
      theme: _buildThemeData(themeProvider.lighttheme),
      darkTheme: _buildThemeData(themeProvider.darktheme),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      builder: (context, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: _buildBottomNavBar(context),
        );
      },
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    final routeName = ModalRoute.of(context)?.settings.name ?? Routes.home;
    int currentIndex = 0;

    switch (routeName) {
      case Routes.home:
        currentIndex = 0;
        break;
      case Routes.news:
        currentIndex = 1;
        break;
      case Routes.notifications:
        currentIndex = 2;
        break;
      case Routes.settings:
        currentIndex = 3;
        break;
    }

    return BottomNavigation(currentIndex: currentIndex);
  }

  ThemeData _buildThemeData(ThemeColors themeColors) {
    return ThemeData(
      primaryColor: themeColors.primaryColor,
      scaffoldBackgroundColor: themeColors.scaffoldBackgroundColor,
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: themeColors.textColor),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: themeColors.accentColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: themeColors.scaffoldBackgroundColor,
        selectedItemColor: themeColors.accentColor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}