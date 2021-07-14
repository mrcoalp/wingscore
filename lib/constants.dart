import 'package:wingscore/screens/about_screen.dart';
import 'package:wingscore/screens/home_screen.dart';
import 'package:flutter/material.dart';

final mThemes = {
  'light': ThemeData(brightness: Brightness.light),
  'dark': ThemeData(brightness: Brightness.dark)
};

final mRoutes = {
  '/': (context) => HomeScreen(),
  '/about': (context) => AboutScreen()
};
