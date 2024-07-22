import 'package:flutter/material.dart';
import 'package:sundar_gutka/utils/utils.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: myActionColorLight,
      ),
      child: child,
    );
  }
}
