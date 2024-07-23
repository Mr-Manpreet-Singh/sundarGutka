import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sundar_gutka/providers/settings_provider.dart';
import 'package:sundar_gutka/utils/utils.dart';
import 'package:sundar_gutka/widgets/language_chip.dart';
import 'package:sundar_gutka/widgets/settings_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  _increaseFontSize(WidgetRef ref) {
    ref.read(settingsProvider.notifier).incFontSize();
  }

  _decreaseFontSize(WidgetRef ref) {
    ref.read(settingsProvider.notifier).decFontSize();
  }

  _increaseFontBoldness(WidgetRef ref) {
    ref.read(settingsProvider.notifier).incFontWeight();
  }

  _decreaseFontBoldness(WidgetRef ref) {
    ref.read(settingsProvider.notifier).decFontWeight();
  }

  _switchBaniView(WidgetRef ref) {
    ref.read(settingsProvider.notifier).updateIsPageView();
  }
  _switchBottomButtons(WidgetRef ref) {
    ref.read(settingsProvider.notifier).updateIsShowBottomButtons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Consumer(builder: (context, ref, child) {
                final settings = ref.watch(settingsProvider);
                return Text(
                  sampleText(settings.language),
                  style: TextStyle(
                    fontSize: settings.fontSize.toDouble(),
                    fontWeight: FontWeight.values[settings.fontWeight],
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            const LanguageSelectionScreen(),
            const SizedBox(height: 16),
            SettingsTile(
              child: Row(
                children: [
                  const Text(
                    "Font Size",
                    style: myF16TextStyle,
                  ),
                  const Expanded(child: SizedBox()),
                  Consumer(builder: (context, ref, child) {
                    final fontSize = ref.watch(
                        settingsProvider.select((value) => value.fontSize));
                    return Row(
                      children: [
                        myIconButton(
                            ref, _decreaseFontSize, Icons.remove_circle),
                        Text(fontSize.toInt().toString(),
                            style: myF16TextStyle),
                        myIconButton(ref, _increaseFontSize, Icons.add_circle),
                      ],
                    );
                  })
                ],
              ),
            ),
            SettingsTile(
              child: Row(
                children: [
                  const Text("Font Boldness", style: myF16TextStyle),
                  const Expanded(child: SizedBox()),
                  Consumer(builder: (context, ref, child) {
                    final fontWeight = ref.watch(
                        settingsProvider.select((value) => value.fontWeight));
                    return Row(
                      children: [
                        myIconButton(
                            ref, _decreaseFontBoldness, Icons.remove_circle),
                        Text(" ${fontWeight.toString()} ",
                            style: myF16TextStyle),
                        myIconButton(
                            ref, _increaseFontBoldness, Icons.add_circle),
                      ],
                    );
                  }),
                ],
              ),
            ),
            
            SettingsTile(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text("Show Navigation Buttons", style: myF16TextStyle),
                      Text("In Page View", style: myF14TextStyle),
                    ],
                  ),
                  
                  Consumer(builder: (context, ref, child) {
                    final isShowBottomButtons = ref.watch(
                        settingsProvider.select((value) => value.isShowBottomButtons));

                    return Switch(
                      value: isShowBottomButtons,
                      onChanged: (_) {
                        _switchBottomButtons(ref);
                      },
                    );
                  }),
                  
                ],
              ),
            ),
            
            SettingsTile(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Scroll View", style: myF16TextStyle),
                  // const SizedBox(width: 20),
                  Consumer(builder: (context, ref, child) {
                    final isPageView = ref.watch(
                        settingsProvider.select((value) => value.isPageView));

                    return Switch(
                      value: isPageView,
                      onChanged: (_) {
                        _switchBaniView(ref);
                      },
                    );
                  }),
                  const Text("Page View", style: myF16TextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconButton myIconButton(WidgetRef ref, Function fn, IconData icon) {
    return IconButton(
      onPressed: () => fn(ref),
      icon: Icon(
        icon,
        size: 30,
        color: myActionColor,
      ),
    );
  }
}
