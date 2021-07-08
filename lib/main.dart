import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:wingscore/screens/about_screen.dart';
import 'package:wingscore/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialTheme = ThemeData(primarySwatch: Colors.blueGrey);

    final cupertinoTheme = CupertinoThemeData(primaryColor: Colors.blueGrey);

    final routes = {
      '/': (context) => HomeScreen(),
      '/about': (context) => AboutScreen()
    };

    return Theme(
      data: materialTheme,
      child: PlatformProvider(
        settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
        builder: (context) => PlatformApp(
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'WingScore',
          material: (_, __) => MaterialAppData(theme: materialTheme),
          cupertino: (_, __) => CupertinoAppData(theme: cupertinoTheme),
          routes: routes,
        ),
      ),
    );
  }
}
