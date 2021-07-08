import 'package:flutter_test/flutter_test.dart';
import 'package:wingscore/screens/home_screen.dart';

import '../utils.dart';

void main() {
  testWidgets('HomeScreen initial state is correct', (tester) async {
    await tester.pumpWidget(wrapWithMediaQuery(const HomeScreen()));

    expect(find.text('WingScore'), findsOneWidget);
  });
}
