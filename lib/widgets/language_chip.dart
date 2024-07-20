import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundar_gutka/data/model.dart';
import 'package:sundar_gutka/providers/settings_provider.dart';
import 'package:sundar_gutka/utils/utils.dart';

class LanguageSelectionScreen extends ConsumerWidget {
  const LanguageSelectionScreen({super.key});

  void _onChipSelected(Language language, WidgetRef ref) {
    ref.read(settingsProvider.notifier).updateLanguage(language);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Language language =
        ref.watch(settingsProvider.select((value) => value.language));

    return Center(
      child: Wrap(
        spacing: 10.0,
        children: [
          ChoiceChip(
            label: const Text('English', style: myF16TextStyle),
            selected: language == Language.english,
            onSelected: (bool selected) {
              _onChipSelected(Language.english, ref);
            },
          ),
          ChoiceChip(
            label: const Text('Hindi', style: myF16TextStyle),
            selected: language == Language.hindi,
            onSelected: (bool selected) {
              _onChipSelected(Language.hindi, ref);
            },
          ),
          ChoiceChip(
            label: const Text('Punjabi', style: myF16TextStyle),
            selected: language == Language.punjabi,
            onSelected: (bool selected) {
              _onChipSelected(Language.punjabi, ref);
            },
          ),
        ],
      ),
    );
  }
}
