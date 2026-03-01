import 'package:flutter/foundation.dart';

class NavigationViewModel {
  final ValueNotifier<int> _currentPageIndex = ValueNotifier(0);
  ValueListenable<int> get currentPageIndex => _currentPageIndex;

  void updatePageIndex(int index) {
    _currentPageIndex.value = index;
  }

  void dipose() {
    _currentPageIndex.dispose();
  }
}
