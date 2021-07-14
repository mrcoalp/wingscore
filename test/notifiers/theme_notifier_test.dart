import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wingscore/constants.dart';
import 'package:wingscore/notifiers/theme_notifier.dart';

void main() {
  test('setting a new theme mode ensures persistence', () {
    final theme = ThemeNotifier();

    expect(theme.getModeSetting(), equals('system'));
    expect(theme.mode, equals(ThemeMode.system));

    var updated = false;

    theme.addListener(() {
      expect(theme.getModeSetting(), equals('dark'));
      expect(theme.mode, equals(ThemeMode.dark));

      final data = mThemes[theme.getModeSetting()];
      expect(data!.brightness, equals(Brightness.dark));

      updated = true;
    });

    theme.updateModeSetting('dark');

    expect(updated, isTrue);
  });
}
