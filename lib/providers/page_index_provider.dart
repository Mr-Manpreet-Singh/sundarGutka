import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageIndexProvider = StateNotifierProvider<PageIndexNotifier, Map<String, int>>(
    (ref) => PageIndexNotifier());

class PageIndexNotifier extends StateNotifier<Map<String, int>> {
  PageIndexNotifier() : super({});

  void updateIndex(String pathName, int index) {
    // Create a copy of the current state and modify it
    final newState = Map<String, int>.from(state);
    // Update the index if key is present or add the key-value pair
    newState[pathName] = index;
    // Update the state with the modified map
    state = newState;
  }
}
