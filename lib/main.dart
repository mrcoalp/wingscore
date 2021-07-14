import 'package:flutter/material.dart';
import 'package:wingscore/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mThemes['light'],
      darkTheme: mThemes['dark'],
      themeMode: ThemeMode.dark,
      routes: mRoutes,
    );
  }
}
