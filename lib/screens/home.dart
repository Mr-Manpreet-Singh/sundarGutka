import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sundar_gutka/screens/pathscreen.dart';
import 'package:sundar_gutka/screens/setting.dart';
import 'package:sundar_gutka/data/path_map.dart';
import 'package:sundar_gutka/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onPress(context, String selectedPath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PathScreen(selectedPath: selectedPath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void navigateToSettings() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SettingScreen(),
        ),
      );
    }

    return PopScope(
      onPopInvoked: (didPop) {
        showExitConfirmationDialog(context);

      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: navigateToSettings,
              icon: const Icon(Icons.settings),
              color: myActionColor,
            ),
            const SizedBox(width: 12),
          ],
          elevation: 5,
          centerTitle: true,
          title: const Text(appTitle),
        ),
        body: ListView.builder(
          itemCount: pathList.length,
          itemBuilder: (context, index) {
            return ListTile(
              iconColor: myBackgroundColorDark,
              leading: const Icon(Icons.double_arrow),
              title: Text(
                pathList[index],
                style: myF22TextStyle,
              ),
              onTap: () => _onPress(context, pathList[index]),
            );
          },
        ),
      ),
    );
  }

  Future showExitConfirmationDialog(BuildContext context) async {
    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Exit'),
        content: const Text(
          'Are you sure you want to exit the app?',
          style: myF18TextStyle,
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () => SystemNavigator.pop(),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
