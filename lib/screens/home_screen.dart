import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popMenuItems = {'About', 'Settings'};

    final popMenuItemsBuilder = (_) {
      return popMenuItems.map((String choice) {
        return PopupMenuItem<String>(
          value: choice,
          child: Text(choice),
        );
      }).toList();
    };

    final handlePopMenuChoice = (String choice) {
      switch (choice) {
        case 'About':
        case 'Settings':
          Navigator.pushNamed(context, '/$choice'.toLowerCase());
          break;
      }
    };

    final popMenuButton = PopupMenuButton<String>(
      key: Key('home_screen_pop_menu'),
      onSelected: handlePopMenuChoice,
      itemBuilder: popMenuItemsBuilder,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('WingScore'),
        actions: [popMenuButton],
      ),
    );
  }
}
