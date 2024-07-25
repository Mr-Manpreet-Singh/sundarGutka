import 'package:flutter/material.dart';
import 'package:sundar_gutka/widgets/settings_tile.dart';

class MyHowToReportMistakeWidget extends StatelessWidget {
  const MyHowToReportMistakeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: SettingsTile(verticalPadding: 24,child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 16),
            children: [
              TextSpan(
                text: 'Steps:\n\n',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextSpan(
                text: '1. Ensure PageView is Enabled\n\n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'You must be in PageView mode. If not, go to the settings and turn the switch towards PageView.\n\n',
              ),
              TextSpan(
                text: '2. Select the Text with an Error\n\n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'Locate and select the text you found to have an error.\n\n',
              ),
              TextSpan(
                text: '3. Tap on the Selected Text\n\n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'Once the text is selected, tap on it. An alert dialogue box will appear.\n\n',
              ),
              TextSpan(
                text: '4. Provide Your Feedback\n\n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'Write your opinion or the corrected text in the provided space, then press the Send button.',
              ),
            ],
          ),
        ),
        ],
      )),
    );
  }
}