import 'package:flutter/foundation.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:expancetracker/core/utils/navigation/routes.dart';

class OnboardingViewModel {
  OnboardingViewModel({required RouterService routerService})
    : _routerService = routerService;

  final RouterService _routerService;

  final ValueNotifier<int> _currentPageIndex = ValueNotifier(0);
  ValueListenable<int> get currentPageIndex => _currentPageIndex;

  void updatePageIndicator(int index) {
    _currentPageIndex.value = index;
  }

  void completeOnboarding() {
    _routerService.go(Routes.home);
  }

  void dipose() {
    _currentPageIndex.dispose();
  }
}
