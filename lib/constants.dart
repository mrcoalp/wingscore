import 'package:wingscore/screens/about_screen.dart';
import 'package:wingscore/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:wingscore/screens/settings_screen.dart';

final mThemes = {
  'light': ThemeData(brightness: Brightness.light),
  'dark': ThemeData(brightness: Brightness.dark)
};

final mRoutes = {
  '/': (_) => HomeScreen(),
  '/about': (_) => AboutScreen(),
  '/settings': (_) => SettingsScreen()
};
