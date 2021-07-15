import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wingscore/screens/about_screen.dart';

void main() {
  testWidgets('[screens] about screen initial state', (tester) async {
    await tester.pumpWidget(MaterialApp(home: AboutScreen()));

    expect(find.text('About'), findsOneWidget);
  });
}
