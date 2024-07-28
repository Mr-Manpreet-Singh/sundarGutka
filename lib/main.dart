import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sundar_gutka/firebase_options.dart';
import 'package:sundar_gutka/utils/constants.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundar_gutka/screens/home.dart';

void main() async {
  print(DateTime.now().toString());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(myActionColor))),
        snackBarTheme:
            const SnackBarThemeData(contentTextStyle: mySnackBarTextStyle),
        colorSchemeSeed: myBackgroundColor,
        chipTheme: const ChipThemeData(
            selectedColor: myActionColor,
            secondaryLabelStyle: TextStyle(color: Colors.white),
            checkmarkColor: myBackgroundColor),
        appBarTheme: const AppBarTheme(backgroundColor: myBackgroundColor),
        bottomAppBarTheme: const BottomAppBarTheme(color: myBackgroundColor),
        switchTheme: const SwitchThemeData(
            trackColor: WidgetStatePropertyAll(myActionColor),
            thumbColor: WidgetStatePropertyAll(Colors.white)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
