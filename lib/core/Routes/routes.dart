import 'package:flutter/material.dart';
import 'package:sawa/screens/Settings/settings.dart';
import 'package:sawa/screens/home/home_screen.dart';
import 'package:sawa/screens/news/news_feed.dart';
import 'package:sawa/screens/notifications/notifications.dart';

class Routes {
  static const String home = '/home';
  static const String news = '/news';
  static const String notifications = '/notifications';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(),
      news: (context) => const NewsFeed(),
      notifications: (context) => const Notifications(),
      settings: (context) => const SettingsScreen(),
    };
  }
}