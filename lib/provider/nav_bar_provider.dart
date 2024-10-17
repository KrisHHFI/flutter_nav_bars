import 'package:flutter/material.dart';
import '../widgets/nav_bar_one.dart';
import '../widgets/nav_bar_two.dart';

class NavBarProvider with ChangeNotifier {
  final List<Map<String, dynamic>> navBars = [
    {
      'name': 'Standard top horizontal navigation bar, with hamburger menu.',
      'widget': const NavBarOne(),
    },
    {
      'name': 'Standard vertical navigation bar.',
      'widget': const NavBarTwo(),
    },
  ];

  // By default, the first item will be the current nav bar
  int _currentIndex = 0;

  NavBarProvider();

  Map<String, dynamic> get currentNavBar => navBars[_currentIndex];

  void nextNavBar() {
    _currentIndex =
        (_currentIndex + 1) % navBars.length; // Loop back to the start
    notifyListeners();
  }
}
