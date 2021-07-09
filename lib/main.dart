import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:wingscore/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialTheme = ThemeData(primarySwatch: Colors.blueGrey);

    final cupertinoTheme = CupertinoThemeData(primaryColor: Colors.blueGrey);

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
          routes: wingscoreRoutes,
        ),
      ),
    );
  }
}
