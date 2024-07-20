import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sundar_gutka/utils/provider.dart';
import 'package:sundar_gutka/utils/utils.dart';
import 'package:sundar_gutka/widgets/language_chip.dart';

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

  _switchView(WidgetRef ref) {
    ref.read(settingsProvider.notifier).updateIsPageView();
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 28),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: myActionColorLight,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Font Size",style: settingScreenTextStyle,),
                  // const SizedBox(width: 80),
                  const Expanded(child: SizedBox()),
                  Consumer(builder: (context, ref, child) {
                    final fontSize = ref.watch(
                        settingsProvider.select((value) => value.fontSize));
                    return Row(
                      children: [
                        myIconButton(ref, _decreaseFontSize, Icons.remove_circle),
                        Text(fontSize.toInt().toString(),style: settingScreenTextStyle),
                        myIconButton(ref, _increaseFontSize, Icons.add_circle),

                      ],
                    );
                  })
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 28),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                // color: myActionColorLight,
                color: myActionColorLight,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Font Boldness",style: settingScreenTextStyle),
                  const Expanded(child: SizedBox()),
                  Consumer(builder: (context, ref, child) {
                    final fontWeight = ref.watch(
                        settingsProvider.select((value) => value.fontWeight));
                    return Row(
                      children: [
                        myIconButton(ref, _decreaseFontBoldness, Icons.remove_circle),
                        Text(" ${fontWeight.toString()} ",style: settingScreenTextStyle),
                        myIconButton(ref, _increaseFontBoldness, Icons.add_circle),
                      ],
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 28),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: myActionColorLight,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Scroll View",style: settingScreenTextStyle),
                  // const SizedBox(width: 20),
                  Consumer(builder: (context, ref, child) {
                    final isPageView = ref.watch(
                        settingsProvider.select((value) => value.isPageView));

                    return Switch(
                      value: isPageView,
                      onChanged: (_) {
                        _switchView(ref);
                      },
                    );
                  }),
                  // const SizedBox(width: 20),
                  const Text("Page View",style: settingScreenTextStyle),
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
      icon:Icon(
          size: 30,
            icon,
            color: myActionColor,
          ),
    );
  }
}
