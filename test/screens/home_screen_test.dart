import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wingscore/constants.dart';
import 'package:wingscore/screens/home_screen.dart';

import '../utils.dart';

void main() {
  testWidgets('home screen initial state is correct', (tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    expect(find.text('WingScore'), findsOneWidget);
  });

  group('home screen app bar trailing actions', () {
    final routeObserver = TestNavigationObserver();

    final home = MaterialApp(
      routes: mRoutes,
      navigatorObservers: [routeObserver],
    );

    testWidgets('about screen shortcut', (tester) async {
      await tester.pumpWidget(home);

      final popMenu = find.byKey(Key('home_screen_pop_menu'));

      expect(popMenu, findsOneWidget);
      expect(find.text('About'), findsNothing);

      await tester.tap(popMenu);
      await tester.pumpAndSettle();

      final about = find.text('About');

      expect(about, findsOneWidget);

      // Verify route pushing
      var pushed = false;
      routeObserver.onPushed = (Route<dynamic>? route, Route<dynamic>? prev) {
        expect(route is PageRoute && route.settings.name == '/about', isTrue);
        expect(prev is PageRoute && prev.settings.name == '/', isTrue);
        pushed = true;
      };

      await tester.tap(about);
      await tester.pumpAndSettle();
      expect(pushed, isTrue);
    });
  });
}
