import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    super.key,
    required this.appBarTitle,
    required this.body,
     this.errorString ="",
  });
  final String appBarTitle;
  final Widget body;
  final String errorString;

  @override
  Widget build(BuildContext context) {
    // Widget showWidget() {
    //   if (screen == WhichScreen.privacyPolicy) {
    //     return const MyPrivacyPolicy();
    //   } else if (screen == WhichScreen.howToReportError) {
    //     return const MyHowToReportMistakeWidget();
    //   } else {
    //     return  SendFeedback(errorString: errorString);
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: body,
    );
  }
}




