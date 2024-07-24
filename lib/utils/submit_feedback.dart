import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sundar_gutka/data/model.dart';
import 'package:sundar_gutka/utils/constants.dart';

abstract class SendFeedbackToFirebase{


  static Future showFeedbackConfirmationDialog(
      BuildContext context, String errorString) async {
    final TextEditingController userInputTextController =
        TextEditingController();

    //  Send Feedback to Firebase
    void submitFeedback() async {
      if (userInputTextController.text == "") return;
      final UserFeedback userFeedback = UserFeedback(
          category: FeedbackCategory.mistake,
          errorString: errorString,
          userMessage: userInputTextController.text);

      try {
        await FirebaseFirestore.instance
            .collection('feedback')
            .add(userFeedback.toMap());
        // call snack bar

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              //   const MySnackBar(
              //   isSuccess: true,
              //   text: "Failed: Check Internet or Again Try Later",
              // )
              // as SnackBar
              SnackBar(
            content: const Text("Feedback Send, Thanks for Contribution"),
            backgroundColor: Colors.green[300],
          ));
        }
      } on Exception catch (_) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("Failed: Check Internet or Try Again Later"),
            backgroundColor: Colors.red[300],
          )
              //   const MySnackBar(
              //   isSuccess: true,
              //   text: "Feedback Send Successfully",
              // ) as SnackBar
              );
        }
      }
    }

    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        title: const Text('Send Feedback'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              errorString,
              style: myF18TextStyle,
            ),
            TextField(
              controller: userInputTextController,
              maxLength: 500,
              keyboardType: TextInputType.multiline,
              autofocus: true,
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  submitFeedback();
                  Navigator.pop(context);
                },
                child: const Text('Send'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

