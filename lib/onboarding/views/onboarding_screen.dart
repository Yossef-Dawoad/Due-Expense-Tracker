import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:expancetracker/onboarding/viewmodels/onboarding_view_model.dart';
import 'package:expancetracker/onboarding/domain/models/page_content.dart';
import 'package:flutter/material.dart';

import 'widgets/indicator.dart';
import 'widgets/onborading_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pageController = PageController();
  late final OnboardingViewModel _viewModel = OnboardingViewModel(
    routerService: locator<RouterService>(),
  );

  @override
  void dispose() {
    _pageController.dispose();
    _viewModel.dipose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// horizontal scrollable pages
          PageView.builder(
            controller: _pageController,
            onPageChanged: _viewModel.updatePageIndicator,
            itemCount: onBoardingPages.length,
            itemBuilder: (context, index) =>
                OnBoardingPage(pageContent: onBoardingPages[index]),
          ),

          /// skip Button
          Positioned(
            top: kToolbarHeight,
            right: 24,
            child: TextButton(
              onPressed: _skipToLastPage,
              child: const Text('Skip'),
            ),
          ),

          /// Dot Navigation
          Positioned(
            bottom: kBottomNavigationBarHeight + 10.0,
            left: 24,
            child: Indicator(
              count: onBoardingPages.length,
              controller: _pageController,
              dotHeight: 16.0,
            ),
          ),

          /// Circluar Navigation Button
          Positioned(
            right: 24,
            bottom: kBottomNavigationBarHeight,
            child: ValueListenableBuilder<int>(
              valueListenable: _viewModel.currentPageIndex,
              builder: (context, currentIndex, _) {
                return ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: (currentIndex == onBoardingPages.length - 1)
                      ? const Text("Continue")
                      : const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _skipToLastPage() {
    final lastPageIndex = onBoardingPages.length - 1;
    if (_viewModel.currentPageIndex.value != lastPageIndex) {
      _pageController.jumpToPage(lastPageIndex);
      return;
    }
    _viewModel.completeOnboarding();
  }

  void _navigateToNextPage() {
    if (_viewModel.currentPageIndex.value == onBoardingPages.length - 1) {
      _viewModel.completeOnboarding();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
