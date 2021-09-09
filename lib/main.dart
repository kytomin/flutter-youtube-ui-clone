import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_youtube_ui/pages/navigation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'YouTube',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(selectedItemColor: Colors.white),
      ),
      home: NavigationPage(),
    );
  }
}
