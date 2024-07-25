
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sundar_gutka/data/model.dart';
import 'package:sundar_gutka/utils/constants.dart';
import 'package:sundar_gutka/utils/utils.dart';

class SendFeedback extends StatelessWidget {
  SendFeedback({super.key, this.errorString = ""});
  final String errorString;
  final TextEditingController userInputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget showErroeText() {
      if (errorString.isNotEmpty) {
        return Text(
          errorString,
          style: myF22TextStyle,
        );
      } else {
        return const SizedBox();
      }
    }

    

    Future<bool> onPressSend() async {
      // hide keyboard
      if (userInputTextController.text.isEmpty) return false;
      final bool hasInternet = await Util.hasInternetConnection(context);
      if (!hasInternet) return false;

      final category = (errorString.isEmpty)
          ? FeedbackCategory.feedback
          : FeedbackCategory.mistake;

      final userFeedback = UserFeedback(
        timeStamp: DateTime.now(),
        category: category,
        errorString: errorString, // Replace with actual error string
        userMessage: userInputTextController.text,
      );

      try {
        await FirebaseFirestore.instance
            .collection('feedback')
            .add(userFeedback.toMap());

        userInputTextController.text = '';
        if(context.mounted) {
          FocusScope.of(context).unfocus();
        }

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  const Text("Sent Successfully, Thanks for Contributing!"),
              backgroundColor: Colors.green[400],
            ),
          );
        }
      } on Exception catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Failed: Try Again Later\nError:$e"),
              backgroundColor: Colors.red[400],
            ),
          );
        }
        return false;
      }
      return true;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (errorString != "") ? const SizedBox(height: 16) : const SizedBox(),
          showErroeText(),
          const SizedBox(height: 16),
          TextField(
            controller: userInputTextController,
            minLines: 3,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Type your Feedback here...',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
              label: const Text("Send Feedback"),
              iconAlignment: IconAlignment.end,
              icon: const Icon(Icons.send),
              onPressed: () {
                onPressSend();
              }),
        ],
      ),
    );
  }
}
