import 'package:flutter/material.dart';
import 'package:sundar_gutka/utils/constants.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.text,
    required this.fun,
  });

  final String text;
  final VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: fun,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: myF17TextStyle),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
