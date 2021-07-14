import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wingscore/screens/settings_screen.dart';

void main() {
  testWidgets('settings screen initial state is correct', (tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsScreen()));

    expect(find.text('Settings'), findsOneWidget);
  });
}
