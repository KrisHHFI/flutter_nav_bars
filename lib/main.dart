import 'package:flutter/material.dart';
import 'widgets/page_content.dart';
import 'provider/nav_bar_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavBarProvider(),
      child: const MaterialApp(
        title: 'Different Nav Bars',
        home: MyHomePage(title: 'Different Nav Bars'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Access the current nav bar from the provider
    final currentNavBar = Provider.of<NavBarProvider>(context).currentNavBar;

    return Scaffold(
      body: Stack(
        children: [
          const PageContent(),
          currentNavBar['widget'],
        ],
      ),
    );
  }
}
