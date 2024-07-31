import 'package:flutter/material.dart';
import 'package:sundar_gutka/utils/constants.dart';
import 'package:sundar_gutka/utils/utils.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/logo.png"),
        ),
        const SizedBox(height: 10),
        const Text(
          appTitle,
          style: myF18TextStyle,
        ),
        const SizedBox(height: 30),
        const Text(
          "Kindly cover your head and remove your shoes before using this app",
          style: myF18TextStyle,
        ),
        const SizedBox(height: 10),
        const Text(
          "We value your input. Please share your comments and suggestions.",
          style: myF18TextStyle,
        ),
        const SizedBox(height: 10),
        const Text(
          "To get in touch directly, you can email us at: ",
          style: myF18TextStyle,
        ),
        TextButton(
          child: const Text(
            'manpreetwork100@gmail.com',
            style: myLinkTextStyle,
          ),
          onPressed: () {
            Util.openEmail();
          },
        ),
        const SizedBox(height: 30),
        const Text(
          "Bhul Chuk Maaf 🙏🙏",
          style: myF18TextStyle,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        const Text(
          "Designed and Developed By :",
          textAlign: TextAlign.center,
        ),
        TextButton(
          child: const Text(
            '~Manpreet Singh',
            style: myLinkTextStyle,
          ),
          onPressed: () =>
              Util.launchURL('https://www.linkedin.com/in/manpreet-singh100'),
        ),
      ]),
    );
  }
}
