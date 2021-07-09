import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _handlePopMenuChoice(String choice, BuildContext context) {
    switch (choice) {
      case 'About':
        Navigator.pushNamed(context, '/about');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const popMenuOptions = {'About'};

    final popMenuButton = PopupMenuButton<String>(
      key: Key('home_screen_pop_menu'),
      onSelected: (String choice) => _handlePopMenuChoice(choice, context),
      itemBuilder: (BuildContext context) {
        return popMenuOptions.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('WingScore'),
        trailingActions: [popMenuButton],
      ),
    );
  }
}
