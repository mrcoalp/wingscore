import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingscore/constants.dart';
import 'package:wingscore/notifiers/theme_notifier.dart';

void main() {
  group('[notifiers] theme provider', () {
    test('setting a new theme mode ensures persistence', () async {
      SharedPreferences.setMockInitialValues(
          {mPersistence['theme']!: 'system'});
      final persistence = await SharedPreferences.getInstance();
      final theme = ThemeNotifier(persistence)..init();

      expect(theme.getModeSetting(), equals('system'));
      expect(theme.mode, equals(ThemeMode.system));

      var updated = false;

      theme.addListener(() {
        expect(theme.getModeSetting(), equals('dark'));
        expect(theme.mode, equals(ThemeMode.dark));

        expect(persistence.getString(mPersistence['theme']!), equals('dark'));

        final data = mThemes[theme.getModeSetting()];
        expect(data!.brightness, equals(Brightness.dark));

        updated = true;
      });

      theme.updateModeSetting('dark');

      expect(updated, isTrue);
    });

    test('setting a null theme mode is handled', () async {
      SharedPreferences.setMockInitialValues(
          {mPersistence['theme']!: 'system'});
      final persistence = await SharedPreferences.getInstance();
      final theme = ThemeNotifier(persistence)..init();

      expect(theme.getModeSetting(), equals('system'));
      expect(theme.mode, equals(ThemeMode.system));

      var updated = false;

      theme.addListener(() {
        updated = true;
      });

      theme.updateModeSetting(null);

      expect(updated, isFalse);
    });

    test('setting an invalid theme mode is handled', () async {
      SharedPreferences.setMockInitialValues(
          {mPersistence['theme']!: 'system'});
      final persistence = await SharedPreferences.getInstance();
      final theme = ThemeNotifier(persistence)..init();

      expect(theme.getModeSetting(), equals('system'));
      expect(theme.mode, equals(ThemeMode.system));

      expect(() => theme.updateModeSetting('invalid'), throwsA(predicate((e) {
        final message = 'Exception: Invalid theme mode: invalid';
        return e is Exception && e.toString() == message;
      })));
    });
  });
}
