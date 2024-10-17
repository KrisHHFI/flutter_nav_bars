import 'package:flutter/material.dart';
import '../widgets/nav_bar_one.dart';

class NavBarProvider with ChangeNotifier {
  final List<Map<String, dynamic>> navBars = [
    {
      'name': 'Standard top horizontal navigation bar, with hamburger menu.',
      'widget': const NavBarOne(),
    },
  ];

  // By default, the first item will be the current nav bar
  Map<String, dynamic> _currentNavBar;

  NavBarProvider()
      : _currentNavBar = {
          'name':
              'Top horizontal standard navigation bar, with hamburger menu.',
          'widget': const NavBarOne(),
        };

  Map<String, dynamic> get currentNavBar => _currentNavBar;

  void setNavBar(Map<String, dynamic> newNavBar) {
    _currentNavBar = newNavBar;
    notifyListeners();
  }
}
