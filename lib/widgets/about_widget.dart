import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text("App name"),
          SizedBox(height: 10),
          Text("Created By: name/logo"),
          SizedBox(height: 10),
          Text("We welcome your comments, suggestions and corrections!"),
          SizedBox(height: 10),
          Text("Please respectfully cover your head and remove your shoes while usingg this app"),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              Text("Bhul Chuk Maaf"),
              Text("App version")
            ],
          )

          
        ],
      )
    );
  }
}
