import 'package:flutter/material.dart';
import '../provider/nav_bar_provider.dart';
import 'package:provider/provider.dart';
import 'nav_bar_three.dart';

class PageContent extends StatefulWidget {
  const PageContent({super.key});

  @override
  PageContentState createState() => PageContentState();
}

class PageContentState extends State<PageContent> {
  @override
  Widget build(BuildContext context) {
    // Access the currentNavBar from the NavBarProvider
    final currentNavBar = Provider.of<NavBarProvider>(context).currentNavBar;
    bool isNavBarThree = currentNavBar['widget'] is NavBarThree;

    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          // Pushes the page content to the right if left vertical nav bar
          left: isNavBarThree ? 75.0 : 16.0,
          right: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text(
                  'Current nav bar: ',
                ),
                Text(
                  currentNavBar['name'],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Change nav bar?',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      // Change the nav bar when the button is pressed
                      Provider.of<NavBarProvider>(context, listen: false)
                          .nextNavBar();
                    },
                    tooltip: 'Change Nav Bar',
                    mini: true,
                    child: const Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
