import 'package:flutter/material.dart';
import 'package:sundar_gutka/utils/constants.dart';

class PageViewBottomAppBar extends StatelessWidget {
  const PageViewBottomAppBar({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

    void _moveToNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300), // Add animation duration
      curve: Curves.ease, // Customize animation curve if desired
    );
  }

  void _moveToPreviousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300), // Add animation duration
      curve: Curves.ease, // Customize animation curve if desired
    );
  }

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
                  onPressed: _moveToPreviousPage,
                  icon: const Icon(Icons.arrow_back_ios_rounded, color: myActionColor),
                  iconSize: 30,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: IconButton(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  onPressed: _moveToNextPage,
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
