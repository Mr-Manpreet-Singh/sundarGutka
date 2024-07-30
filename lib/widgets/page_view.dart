import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundar_gutka/data/model.dart';
import 'package:sundar_gutka/providers/page_index_provider.dart';
import 'package:sundar_gutka/providers/settings_provider.dart';
import 'package:sundar_gutka/utils/constants.dart';
import 'package:sundar_gutka/utils/utils.dart';
import 'package:sundar_gutka/widgets/my_scaffold.dart';
import 'package:sundar_gutka/widgets/page_view_bottom_bar.dart';
import 'package:sundar_gutka/widgets/send_feedback.dart';

class PathPageView extends ConsumerWidget {
  const PathPageView({
    super.key,
    required this.selectedPath,
    required this.navigateToSettingScreen,
    // required this.pageController,
  });

  final String selectedPath;
  final Function navigateToSettingScreen;
  // final PageController pageController;

  int _getLastPageNumber(Language lang) {
    return Util.splitByEmptyLinesAndMaxLength(
            Util.mapOfPathOfSelectedLanguage(lang)[selectedPath]!)
        .length;
  }

  void _savePageIndex(int index, WidgetRef ref) {
    ref.read(pageIndexProvider.notifier).updateIndex(selectedPath, index);
  }

  void _goToPage(int newPage, int length, PageController pageController) {
    if (newPage > -1 && newPage <= length) {
      pageController.animateToPage(newPage,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  void _showNumberInputDialog(
      BuildContext context, int length, PageController pageController) {
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
                  _goToPage(
                      int.parse(enteredValue) - 1, length, pageController);
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
  Widget build(BuildContext context, WidgetRef ref) {
    late int lastPageNo;
    // rebuilding screen in case of language change
    final List<String> bani = ref.watch(
      settingsProvider.select(
        (value) {
          lastPageNo = _getLastPageNumber(value.language);
          final Map<String, String> selectedFullPath =
              Util.mapOfPathOfSelectedLanguage(value.language);
          final List<String> bani = Util.splitByEmptyLinesAndMaxLength(
              selectedFullPath[selectedPath]!);
          return bani;
        },
      ),
    );

    final int savedIndex = ref.read(pageIndexProvider)[selectedPath] ?? 0;
    final PageController pageController =
        PageController(initialPage: savedIndex);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Text("Go", style: gotextTextStyle),
            onPressed: () =>
                _showNumberInputDialog(context, lastPageNo, pageController),
          ),
          IconButton(
              onPressed: () {
                navigateToSettingScreen(context);
              },
              icon: const Icon(Icons.settings),
              color: myActionColor),
          const SizedBox(
            width: 12,
          )
        ],
        elevation: 1,
        title: Text(selectedPath),
        centerTitle: false,
      ),
      body: PageView.builder(
        itemCount: lastPageNo,
        controller: pageController,
        onPageChanged: (value) {
          _savePageIndex(value, ref);
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
                        "${index + 1}  of  $lastPageNo",
                        style: myF14TextStyle,
                      ),
                    ),
                    Consumer(builder: (context, ref, child) {
                      final fontWeight = ref.watch(
                          settingsProvider.select((value) => value.fontWeight));
                      final fontSize = ref.watch(
                          settingsProvider.select((value) => value.fontSize));

                      final String part = bani[index];
                      String errorString = "";
                      bool onTapPressed = false;

                      // return Text(
                      //   part,
                      //   style: TextStyle(
                      //     fontSize: fontSize.toDouble(),
                      //     fontWeight: FontWeight.values[fontWeight],
                      //   ),
                      //   textAlign: TextAlign.center,
                      // );
                      return SelectableText(
                        part,
                        onSelectionChanged: (selection, cause) {
                          final String str = selection.textInside(part);
                          if (str == "" && onTapPressed == false) return;
                          onTapPressed = false;
                          errorString = str;
                        },
                        onTap: () {
                          if (errorString == "") return;
                          onTapPressed = true;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => MyScaffold(
                                      appBarTitle: "Report Mistake",
                                      body: SendFeedback(
                                        errorString: errorString,
                                      ),
                                    )),
                          );
                        },
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
      bottomNavigationBar: Visibility(
        visible: ref.watch(
            settingsProvider.select((value) => value.isShowBottomButtons)),
        child: PageViewBottomAppBar(pageController: pageController),
      ),
    );
  }
}
