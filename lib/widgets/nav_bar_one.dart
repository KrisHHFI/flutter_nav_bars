import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBarOne extends StatefulWidget {
  const NavBarOne({super.key});

  @override
  NavBarOneState createState() => NavBarOneState();
}

class NavBarOneState extends State<NavBarOne> {
  bool isMenuOpen = false;

  // To track which item is hovered
  String? hoveredItem;

  final navLinks = [
    'Home',
    'Company',
    'Services',
    'Contact',
  ];

  final List<Map<String, String>> socialIcons = [
    {
      'icon': 'images/CameraIconWhite.png',
      'url': 'https://www.shutterstock.com/g/Kristopher+Pepper?rid=263519982',
    },
    {
      'icon': 'images/GitHubWhite.png',
      'url': 'https://github.com/KrisHHFI',
    },
    {
      'icon': 'images/LinkedInWhite.png',
      'url': 'https://www.linkedin.com/in/kristopher-pepper-824184136/',
    },
  ];

  // Function to launch URL in a new tab
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    String logo =
        isSmallScreen ? 'images/XLogo.png' : 'images/XLogoCompany.png';

    // The content which is returned to the screen
    return Stack(
      children: [
        // Blurs the entire page behind the mobile nav
        if (isMenuOpen && isSmallScreen)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        Container(
          padding: const EdgeInsets.all(16.0),
          color: const Color.fromRGBO(0, 0, 0, 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                logo,
                height: 30,
                fit: BoxFit.contain,
              ),
              if (isSmallScreen)
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMenuOpen = !isMenuOpen;
                      });
                    },
                    child: Image.network(
                      'images/Menu.png',
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              else
                Row(
                  children: navLinks.map((item) {
                    bool isHovered = hoveredItem == item;
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) {
                        setState(() {
                          hoveredItem = item;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          hoveredItem = null;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02,
                        ),
                        child: GestureDetector(
                          child: Stack(
                            children: [
                              if (isHovered)
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              Text(
                                item,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
        // The opened hamburger menu
        if (isMenuOpen && isSmallScreen)
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 62.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: navLinks.map((item) {
                        bool isHovered = hoveredItem == item;
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) {
                            setState(() {
                              hoveredItem = item;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              hoveredItem = null;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: GestureDetector(
                              child: Stack(
                                children: [
                                  if (isHovered)
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                  Text(
                                    item,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: socialIcons.map((social) {
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: GestureDetector(
                                onTap: () => _launchURL(social['url']!),
                                child: Image.network(
                                  social['icon']!,
                                  height: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
