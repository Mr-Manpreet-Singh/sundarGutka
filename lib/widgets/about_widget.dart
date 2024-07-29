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
      padding: EdgeInsets.all(16),
      child: Column(children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/logo.png"),
        ),
        SizedBox(height: 10),
        Text(
          appTitle,
          style: myF18TextStyle,
        ),
        SizedBox(height: 30),
        Text(
          "Kindly cover your head and remove your shoes before using this app",
          style: myF18TextStyle,
        ),
        SizedBox(height: 10),
        Text(
          "We value your input. Please share your comments and suggestions.",
          style: myF18TextStyle,
        ),
        SizedBox(height: 10),
        Text(
          "To get in touch directly, you can email us at: ",
          style: myF18TextStyle,
        ),
        TextButton( 
          
              child:Text( 'manpreetwork100@gmail.com ',
              style: myLinkTextStyle,),
             onPressed: () {
                  Util.openEmail();
                },
            ),
        SizedBox(height: 30),
        Text("Bhul Chuk Maaf 🙏🙏", style: myF18TextStyle,textAlign: TextAlign.start,),
         SizedBox(height: 10),
        Text("Designed and Developed By ~Manpreet Singh"),
      ]),
    );
  }
}
