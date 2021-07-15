import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wingscore/notifiers/theme_notifier.dart';

class _ThemeSelectDialog extends StatelessWidget {
  const _ThemeSelectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final select = (String mode) => Navigator.pop(context, mode);

    return SimpleDialog(
      title: Text('Choose theme'),
      children: [
        SimpleDialogOption(
          onPressed: () => select('system'),
          child: const Text('System default'),
        ),
        SimpleDialogOption(
          onPressed: () => select('light'),
          child: const Text('Light'),
        ),
        SimpleDialogOption(
          onPressed: () => select('dark'),
          child: const Text('Dark'),
        ),
      ],
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showThemeDialog = () {
      final setThemeMode = (String? mode) {
        Provider.of<ThemeNotifier>(context, listen: false)
            .updateModeSetting(mode);
      };

      showDialog<String>(
        context: context,
        builder: (_) => _ThemeSelectDialog(),
      ).then(setThemeMode);
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          TextButton(onPressed: showThemeDialog, child: Text('Theme')),
        ],
      ),
    );
  }
}
