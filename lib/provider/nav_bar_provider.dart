import 'package:flutter/material.dart';
import '../widgets/nav_bar_one.dart';
import '../widgets/nav_bar_two.dart';
import '../widgets/nav_bar_three.dart';
import '../widgets/nav_bar_four.dart';

class NavBarProvider with ChangeNotifier {
  final List<Map<String, dynamic>> navBars = [
    {
      'name': '1. Standard top horizontal navigation bar, with hamburger menu.',
      'widget': const NavBarOne(),
    },
    {
      'name': '2. Bottom horizontal navigation bar, with hamburger menu.',
      'widget': const NavBarTwo(),
    },
    {
      'name': '3. Side vertical navigation bar, with hamburger menu.',
      'widget': const NavBarThree(),
      'padding': 'left',
    },
    {
      'name': '4.',
      'widget': const NavBarFour(),
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
