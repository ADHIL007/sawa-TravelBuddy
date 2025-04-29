import 'package:flutter/material.dart';
import 'package:sawa/core/Routes/routes.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;

  const BottomNavigation({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, Routes.home);
        break;
      case 1:
        Navigator.pushNamed(context, Routes.news);
        break;
      case 2:
        Navigator.pushNamed(context, Routes.notifications);
        break;
      case 3:
        Navigator.pushNamed(context, Routes.settings);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.secondary,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper_outlined),
          activeIcon: Icon(Icons.newspaper),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
          activeIcon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          activeIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}