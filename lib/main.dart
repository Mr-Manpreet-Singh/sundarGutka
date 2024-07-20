import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundar_gutka/screens/home.dart';
import 'package:sundar_gutka/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const ProviderScope(
   
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: myBackgroundColor,
        chipTheme: const ChipThemeData(selectedColor: myActionColor,secondaryLabelStyle:TextStyle(color:  Colors.white), checkmarkColor: myBackgroundColor),
        appBarTheme:  const AppBarTheme(backgroundColor: myBackgroundColor),
        bottomAppBarTheme: const BottomAppBarTheme(color: myBackgroundColor),
        switchTheme:  const SwitchThemeData(trackColor: MaterialStatePropertyAll(myActionColor),thumbColor: MaterialStatePropertyAll(Colors.white)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
