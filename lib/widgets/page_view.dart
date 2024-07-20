import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundar_gutka/providers/page_provider.dart';
import 'package:sundar_gutka/providers/settings_provider.dart';
import 'package:sundar_gutka/utils/utils.dart';

class PathPageView extends ConsumerStatefulWidget {
  const PathPageView({
    super.key,
    required this.selectedPath,
    required this.navigateToSettingScreen,
    required this.lastPageNo,
  });

  final String selectedPath;
  final int lastPageNo;
  final Function navigateToSettingScreen;

  @override
  ConsumerState<PathPageView> createState() => _PathPageViewState();
}

class _PathPageViewState extends ConsumerState<PathPageView> {
  late final PageController _pageController;
  late final int previouslySavedIndex;
  @override
  void initState() {
    super.initState();
    previouslySavedIndex = getPrevIndex(widget.selectedPath);
    _pageController = PageController(initialPage: previouslySavedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int getPrevIndex(String path) {
    final indexMap = ref.read(pageIndexProvider);
    return indexMap[path] ?? 0;
  }

  void savePageIndex(int index) {
    ref
        .read(pageIndexProvider.notifier)
        .updateIndex(widget.selectedPath, index);
  }

  // void _moveToNextPage() {
  //   _pageController.nextPage(
  //     duration: const Duration(milliseconds: 300), // Add animation duration
  //     curve: Curves.ease, // Customize animation curve if desired
  //   );
  // }

  // void _moveToPreviousPage() {
  //   _pageController.previousPage(
  //     duration: const Duration(milliseconds: 300), // Add animation duration
  //     curve: Curves.ease, // Customize animation curve if desired
  //   );
  // }

  void _goToPage(int newPage, int length) {
    if (newPage > -1 && newPage <= length) {
      _pageController.animateToPage(newPage,
          duration: const Duration(milliseconds: 500), // Add animation duration
          curve: Curves.ease); // Customize animation curve if desired
    }
  }

  void showNumberInputDialog(BuildContext context, int length) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          title: const Text('Go to page '),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter number 1 to $length',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle GO button press
                String enteredValue = controller.text;
                if (enteredValue.isNotEmpty &&
                    int.tryParse(enteredValue) != null) {
                  Navigator.pop(context, enteredValue);
                  _goToPage(int.parse(enteredValue) - 1, length);
                }
              },
              child: const Text('GO'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Text("Go", style: gotextTextStyle),
            onPressed: () => showNumberInputDialog(context, widget.lastPageNo),
          ),
          IconButton(
              onPressed: () {
                widget.navigateToSettingScreen(context);
              },
              icon: const Icon(Icons.settings),
              color: myActionColor),
          const SizedBox(
            width: 12,
          )
        ],
        elevation: 1,
        title: Text(widget.selectedPath),
        centerTitle: false,
      ),
      body: PageView.builder(
        itemCount: widget.lastPageNo,
        controller: _pageController,
        onPageChanged: (value) {
          savePageIndex(value);
        },
        itemBuilder: (context, index) {
          final scrollController = ScrollController();
          return RawScrollbar(
            controller: scrollController,
            minOverscrollLength: 2,
            thumbColor: myScrollbarThumbColor,
            crossAxisMargin: 2,
            thickness: 8.0,
            radius: const Radius.circular(10),
            mainAxisMargin: 5,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 10),
                      decoration: BoxDecoration(
                          color: myBackgroundColor,
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        "${index + 1}  of  ${widget.lastPageNo}",
                        style: myF14TextStyle,
                      ),
                    ),
                    Consumer(builder: (context, ref, child) {
                      final language = ref.watch(
                          settingsProvider.select((value) => value.language));
                      final fontWeight = ref.watch(
                          settingsProvider.select((value) => value.fontWeight));
                      final fontSize = ref.watch(
                          settingsProvider.select((value) => value.fontSize));
                      final selectedFullPath =
                          mapOfPathOfSelectedLanguage(language);

                      return Text(
                        splitByEmptyLinesAndMaxLength(
                            selectedFullPath[widget.selectedPath]!, 400)[index],
                        style: TextStyle(
                          fontSize: fontSize.toDouble(),
                          fontWeight: FontWeight.values[fontWeight],
                        ),
                        textAlign: TextAlign.center,
                      );
                    })
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // bottomNavigationBar: PageViewBottomAppBar(
      //   moveToNextPage: _moveToNextPage,
      //   moveToPreviousPage: _moveToPreviousPage,
      // ),
    );
  }
}
