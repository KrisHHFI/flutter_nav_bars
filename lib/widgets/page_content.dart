import 'package:flutter/material.dart';
import '../provider/nav_bar_provider.dart';
import 'package:provider/provider.dart';

class PageContent extends StatefulWidget {
  const PageContent({super.key});

  @override
  PageContentState createState() => PageContentState();
}

class PageContentState extends State<PageContent> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access the currentNavBar from the NavBarProvider
    final currentNavBar = Provider.of<NavBarProvider>(context).currentNavBar;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Change nav bar?',
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
