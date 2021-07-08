import 'package:flutter_test/flutter_test.dart';
import 'package:wingscore/screens/about_screen.dart';

import '../utils.dart';

void main() {
  testWidgets('AboutScreen initial state is correct', (tester) async {
    await tester.pumpWidget(wrapWithMediaQuery(const AboutScreen()));

    expect(find.text('About'), findsOneWidget);
  });
}
