import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popMenuOptions = {'About'};

    final popMenuItemsBuilder = (_) {
      return popMenuOptions.map((String choice) {
        return PopupMenuItem<String>(
          value: choice,
          child: Text(choice),
        );
      }).toList();
    };

    final handlePopMenuChoice = (String choice) {
      switch (choice) {
        case 'About':
          Navigator.pushNamed(context, '/about');
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
