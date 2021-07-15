import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingscore/constants.dart';
import 'package:wingscore/notifiers/theme_notifier.dart';
import 'package:wingscore/screens/settings_screen.dart';

void main() {
  testWidgets('[screens] settings screen initial state', (tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsScreen()));

    expect(find.text('Settings'), findsOneWidget);
  });

  group('[screens] display settings', () {
    final getWidget = (tester) async {
      final mockPersistence = {mPersistence['theme']!: 'system'};

      SharedPreferences.setMockInitialValues(mockPersistence);
      final persistence = await SharedPreferences.getInstance();
      final notifier = ThemeNotifier(persistence)..init();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (_) => notifier,
        child: MaterialApp(home: SettingsScreen()),
      ));

      return notifier;
    };

    group('theme settings', () {
      final themeTester = (String theme, String mode) {
        testWidgets('$mode theme', (tester) async {
          final notifier = await getWidget(tester);

          final themeSettingBtn = find.text('Theme');
          expect(themeSettingBtn, findsOneWidget);

          var updated = false;

          notifier.addListener(() {
            updated = true;
            expect(notifier.getModeSetting(), mode);
          });

          await tester.tap(themeSettingBtn);
          await tester.pumpAndSettle();

          await tester.tap(find.text(theme));
          await tester.pumpAndSettle();

          expect(updated, isTrue);
        });
      };

      themeTester('System default', 'system');
      themeTester('Light', 'light');
      themeTester('Dark', 'dark');
    });
  });
}
