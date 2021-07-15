import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingscore/constants.dart';

class ThemeNotifier extends ChangeNotifier {
  final SharedPreferences _persistence;

  ThemeNotifier(this._persistence);

  final _modes = {
    'light': ThemeMode.light,
    'dark': ThemeMode.dark,
    'system': ThemeMode.system
  };

  var _current = 'system';

  void init() {
    _current = this._persistence.getString(mPersistence['theme']!) ?? 'system';
  }

  ThemeMode get mode => _modes[_current] ?? ThemeMode.system;

  String getModeSetting() => _current;

  void updateModeSetting(String? mode) {
    // Skip when mode is null
    if (mode == null) {
      return;
    }
    // Throw if invalid mode
    if (!_modes.containsKey(mode)) {
      throw Exception('Invalid theme mode: $mode');
    }
    _current = mode;
    this._persistence.setString(mPersistence['theme']!, _current);
    notifyListeners();
  }
}
