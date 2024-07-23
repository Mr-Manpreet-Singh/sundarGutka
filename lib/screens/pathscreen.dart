import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sundar_gutka/screens/setting.dart';
import 'package:sundar_gutka/providers/settings_provider.dart';
import 'package:sundar_gutka/widgets/page_view.dart';
import 'package:sundar_gutka/widgets/scroll_view.dart';

class PathScreen extends ConsumerWidget {
  const PathScreen({super.key, required this.selectedPath});

  final String selectedPath;

  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPageView =
        ref.watch(settingsProvider.select((value) => value.isPageView));

    return (isPageView)
        ? PathPageView(
            selectedPath: selectedPath,
            navigateToSettingScreen: _navigateToSettings,
          )
        : PathScrollView(
            selectedPath: selectedPath,
            navigateToSettingScreen: _navigateToSettings);
  }
}
