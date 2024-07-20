import 'package:flutter/material.dart';
import 'package:sundar_gutka/utils/utils.dart';

class PageViewBottomAppBar extends StatelessWidget {
  const PageViewBottomAppBar({
    super.key,
    required this.moveToNextPage,
    required this.moveToPreviousPage,
  });

  final VoidCallback moveToPreviousPage;
  final VoidCallback moveToNextPage;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BottomAppBar(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  onPressed: moveToPreviousPage,
                  icon: const Icon(Icons.arrow_back_ios_rounded, color: myActionColor),
                  iconSize: 30,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  onPressed: moveToNextPage,
                  icon: const Icon(Icons.arrow_forward_ios_rounded, color: myActionColor),
                  iconSize: 30,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
