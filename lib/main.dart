import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundar_gutka/screens/home.dart';
import 'package:sundar_gutka/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
