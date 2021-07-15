import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wingscore/constants.dart';
import 'package:provider/provider.dart';
import 'package:wingscore/notifiers/theme_notifier.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final builder = (_, ThemeNotifier theme, __) {
      return MaterialApp(
        theme: mThemes['light'],
        darkTheme: mThemes['dark'],
        themeMode: theme.mode,
        routes: mRoutes,
      );
    };

    return Consumer<ThemeNotifier>(builder: builder);
  }
}

void main() {
  SharedPreferences.getInstance().then((persistence) {
    final app = ChangeNotifierProvider(
      create: (_) => ThemeNotifier(persistence)..init(),
      child: MyApp(),
    );

    runApp(app);
  });
}
