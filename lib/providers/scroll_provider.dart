import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollPosition {
  final double offset;
  ScrollPosition(this.offset);
}

final scrollPositionProvider =
    StateNotifierProvider<ScrollPositionNotifier, Map<String, ScrollPosition>>(
        (ref) => ScrollPositionNotifier());

class ScrollPositionNotifier
    extends StateNotifier<Map<String, ScrollPosition>> {
  ScrollPositionNotifier() : super({});

  void updateScrollPosition(String key, double offset) {
    state = {
      ...state,
      key: ScrollPosition(offset),
    };
  }
}

