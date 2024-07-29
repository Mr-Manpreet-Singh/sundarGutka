import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sundar_gutka/utils/constants.dart';
import 'package:sundar_gutka/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPrivacyPolicy extends StatelessWidget {
  const MyPrivacyPolicy({
    super.key,
  });

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(
              text: 'Privacy Policy\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextSpan(
              text: 'About this document\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextSpan(
              text:
                  'Manpreet Singh Labs considers user privacy of utmost importance and takes all precautions to protect user privacy during use of our android apps. This document details privacy policy for our android apps. Please take a moment to familiarize yourself with our privacy practices.\n\n',
            ),
            TextSpan(
              text: 'What we don\'t collect\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextSpan(
              text:
                  'We do not collect any personal information about the users of our apps. In other words, we do not collect information such as your name, address, phone number, or email address.\n\n',
            ),
            TextSpan(
              text: 'What we collect\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextSpan(
              text:
                  'Like others, we anonymously collect some non-personal information via 3rd party technologies such as Google Analytics, Google Admob, and Facebook Audience Network, who are governed by their own privacy policies. We collect the data related to profiling of different parts of the application. Data collected is in aggregated form and analyzed as such. Also, we use anonymous identifiers when you interact with analytics and advertising services. As such, there’s no way Manpreet Singh can map data collected to any individual user or device. The kind of information collected includes, but is not limited to, type of device or version of the OS you are using, general location data, app crash report, user sessions information, and general pattern of app use. Also, we save your application data and preferences for personalization. This data is stored in your device’s internal storage. We do not have access to the same. As stated, we do not collect any personal information about the users of our apps and hence your non-personal data is truly anonymous.\n\n',
            ),
            TextSpan(
              text: 'What we store and its security\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextSpan(
              text:
                  'We store your application data and preferences in your device internal storage. We do not store any of your data on our servers. We take necessary actions, as standardized by android operating system, to protect data stored on your device from unauthorized access. Data and preferences stored on your device will be deleted upon uninstall of our app from your device. Non-personal information is collected via 3rd party analytics and advertising partners and is hosted on their respective servers. Please refer to later sections for details on how they handle security, privacy, and sharing of this data.\n\n',
            ),
            TextSpan(
              text: 'How we use information that we collect\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextSpan(
              text:
                  'We only collect non-personal user data in anonymous and aggregate form. Data collected is used for further enhancement of application and solely used by us. We do not share, sell or rent it to any individuals or companies. We use information to get a better understanding of what users prefer in general, improve user experience, performance, and reliability of our Apps. In addition to that, we may use Non-Personal Information to personalize user experience at app level and for marketing and promotional purposes.\n\n',
            ),
            TextSpan(
              text: 'What we share\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextSpan(
              text:
                  'We do not sell, trade, or rent any non-personal information pertaining to our app users. We do not collect any personal information pertaining to our users. We do use 3rd party technology solutions for analytics and to show ads and they do collect anonymous usage information. Please refer to later sections for more details.\n\n',
            ),
            TextSpan(
              text: 'Advertising and Analytics Services Provided by Others\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextSpan(
              text:
                  'We offer free android apps and use 3rd party ads, offered by ‘Google Admob’ and ‘Facebook Audience Network’, to monetize our apps. Also, we use 3rd party analytics services, ‘Google Analytics’ in our case, to analyze performance and usage patterns of our android apps. Ad companies may use and collect anonymous data about your interests to customize content and advertising in our applications. Interest and location data may be linked to your device, but is not linked to your identity. Analytics companies may access anonymous data to help us understand how our services are used.\n\nThey use this data solely on our behalf. They do not share it except in aggregate form; no data is shared as to any individual user. Please refer to respective privacy policies of these 3rd party solution providers to get more details on how manage your privacy.\n',
            ),
            TextSpan(
              text: 'Google Analytics Policy\n',
              style: myLinkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _launchURL('https://policies.google.com/privacy');
                },
            ),
            TextSpan(
              text: 'Google Admob Privacy Policy\n',
              style: myLinkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _launchURL('https://policies.google.com/privacy');
                },
            ),
            TextSpan(
              text: 'Google Privacy Policy\n',
              style: myLinkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _launchURL('https://policies.google.com/privacy');
                },
            ),
            TextSpan(
              text: 'Facebook Audience Network Policy\n',
              style: myLinkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _launchURL('https://www.facebook.com/policies/cookies/');
                },
            ),
            TextSpan(
              text: 'Facebook Privacy Policy\n\n',
              style: myLinkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _launchURL('https://www.facebook.com/about/privacy');
                },
            ),
            TextSpan(
              text: 'App permissions\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextSpan(
              text:
                  'Our apps may require simple/advance permissions to access some device functionalities critical to functioning of our apps. We ask for these permissions at time of app install and/or when our app requires access to device functionality. You may revoke any of these permissions anytime from your device settings but it may restrict our app functionality.\n\n',
            ),
            TextSpan(
              text: 'Changes to this privacy policy\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextSpan(
              text:
                  'This privacy policy was last updated on 1 Aug, 2024. Our privacy policy may change from time to time. We will post any Privacy Policy changes on this page. We reserve the right, at any time, to add to, change, update, or modify this privacy policy, simply by posting such change, update, or modification on this page and it will be effective immediately upon posting on this page. We will communicate to you regarding the same via update in our android app and on Google Play Store page for the same. It is your responsibility to review this Policy from time to time to ensure that you continue to agree with all of its terms.\n\n',
            ),
            TextSpan(
              text: 'Your acceptance of these terms\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextSpan(
              text:
                  'By using this app, you signify your acceptance of this policy. If you do not agree to this policy, please do not use our app. Your continued use of our android apps following the posting of changes to this policy will be deemed your acceptance of those changes.\n\n',
            ),
            TextSpan(
              text: 'Contacting us\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextSpan(
              text:
                  'If you have any questions regarding the Privacy Policy, please contact us at the following email address: - ',
            ),
            TextSpan(
              text: 'manpreetwork100@gmail.com ',
              style: myLinkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Util.openEmail();
                },
            ),
          ],
        ),
      ),
    );
  }
}
