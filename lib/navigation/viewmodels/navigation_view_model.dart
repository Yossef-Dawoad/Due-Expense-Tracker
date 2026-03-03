import 'package:flutter/foundation.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:expancetracker/core/utils/navigation/routes.dart';

class NavigationViewModel {
  NavigationViewModel({required RouterService routerService})
    : _routerService = routerService;

  final RouterService _routerService;

  final ValueNotifier<int> _currentPageIndex = ValueNotifier(0);
  ValueListenable<int> get currentPageIndex => _currentPageIndex;

  void updatePageIndex(int index) {
    _currentPageIndex.value = index;
  }

  void goToAddTransaction() {
    _routerService.go(Routes.addTransaction);
  }

  void dipose() {
    _currentPageIndex.dispose();
  }
}
