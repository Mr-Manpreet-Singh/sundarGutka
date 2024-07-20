import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundar_gutka/providers/scroll_provider.dart';
import 'package:sundar_gutka/screens/setting.dart';
import 'package:sundar_gutka/providers/settings_provider.dart';
import 'package:sundar_gutka/utils/utils.dart';

class PathScrollView extends ConsumerWidget {
  const PathScrollView({
    super.key,
    required this.selectedPath,
  });

  final String selectedPath;

  void _navigateToSettings(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollPosition = ref.read(scrollPositionProvider);
    final scrollController = ScrollController(
        initialScrollOffset: scrollPosition[selectedPath]?.offset ?? 0.0
        );

    scrollController.addListener(() {
      ref
          .read(scrollPositionProvider.notifier)
          .updateScrollPosition(selectedPath, scrollController.offset);
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _navigateToSettings(context);
              },
              icon: const Icon(Icons.settings),
              color: myActionColor),
          const SizedBox(
            width: 12,
          )
        ],
        elevation: 1,
        title: Text(selectedPath),
        centerTitle: false,
      ),
      body: RawScrollbar(
        controller: scrollController,
        minThumbLength: 75,
        thumbColor: myScrollbarThumbColor,
        crossAxisMargin: 1,
        thickness: 5.0,
        radius: const Radius.circular(10),
        mainAxisMargin: 5,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(20.0),
          child: Center(child: Consumer(builder: (context, ref, child) {
            final language =
                ref.watch(settingsProvider.select((value) => value.language));
            final fontWeight =
                ref.watch(settingsProvider.select((value) => value.fontWeight));
            final fontSize =
                ref.watch(settingsProvider.select((value) => value.fontSize));

            final selectedFullPath = mapOfPathOfSelectedLanguage(language);
            return Text(
              (selectedFullPath[selectedPath]!),
              style: TextStyle(
                fontSize: fontSize.toDouble(),
                fontWeight: FontWeight.values[fontWeight],
              ),
              textAlign: TextAlign.center,
            );
          })),
        ),
      ),
    );
  }
}
