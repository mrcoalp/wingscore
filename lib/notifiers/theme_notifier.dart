import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeNotifier();

  final _modes = {
    'light': ThemeMode.light,
    'dark': ThemeMode.dark,
    'system': ThemeMode.system
  };

  var _current = 'system';

  ThemeMode get mode => _modes[_current] ?? ThemeMode.system;

  String getModeSetting() => _current;

  void updateModeSetting(String mode) {
    _current = mode;
    notifyListeners();
  }
}
