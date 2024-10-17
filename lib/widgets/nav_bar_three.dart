import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBarThree extends StatefulWidget {
  const NavBarThree({super.key});

  @override
  NavBarThreeState createState() => NavBarThreeState();
}

class NavBarThreeState extends State<NavBarThree> {
  bool isMenuOpen = false;
  double navBarImageHeight = 30.00;
  double smallPadding = 16.00;
  String smallLogo = 'images/XLogo.png';
  String largeLogo = 'images/XLogoCompany.png';
  String menuIcon = 'images/Menu.png';

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
    String logo = isSmallScreen ? smallLogo : largeLogo;
    double logoDividerWidth = isSmallScreen ? 50 : 150;

    // The content which is returned to the screen ----------------------------
    return Stack(
      children: [
        // Blurs the entire page behind the mobile nav ----------------------------
        if (isMenuOpen && isSmallScreen)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        // The nav bar container and logo ----------------------------
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, smallPadding, 10, 10),
            color: Color.fromRGBO(187, 187, 187, 1),
            child: Column(
              children: [
                Image.network(
                  logo,
                  height: navBarImageHeight,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: logoDividerWidth,
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
                const SizedBox(height: 20),
                // Mobile nav top bar ----------------------------
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
                        menuIcon,
                        height: navBarImageHeight,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                // The nav bar links ----------------------------
                else
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
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.02,
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
        ),
        // The opened hamburger menu ----------------------------
        if (isMenuOpen && isSmallScreen)
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
                      padding: EdgeInsets.symmetric(vertical: smallPadding),
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
              // Spacing inbetween the links and the icons
              const SizedBox(height: 75),
              // The hamburger icons ----------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: socialIcons.map((social) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: GestureDetector(
                        onTap: () => _launchURL(social['url']!),
                        child: Image.network(
                          social['icon']!,
                          height: navBarImageHeight,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 100),
            ],
          ),
      ],
    );
  }
}
