import 'package:flutter/material.dart';
import 'package:sundar_gutka/utils/constants.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundar_gutka/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // print("RES = $res.");
  // print("NAME = ${res.name}\n");
  // print("OPTIONS = ${res.options}\n");
  runApp(const MyApp());
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
        snackBarTheme: const SnackBarThemeData(
          contentTextStyle:  mySnackBarTextStyle
        ),
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
