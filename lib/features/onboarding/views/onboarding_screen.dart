import 'package:expancetracker/core/constants/colors.dart';
import 'package:expancetracker/core/routes/routes.dart';
import 'package:expancetracker/features/onboarding/data/models/page_content.dart';
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
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: Stack(
        children: [
          /// horizontal scrollable pages

          PageView.builder(
            controller: _pageController,
            onPageChanged: _updatePageIndicator,
            itemCount: onBoardingPages.length,
            itemBuilder: (context, index) => OnBoardingPage(pageContent: onBoardingPages[index]),
          ),

          /// skip Button
          Positioned(
            top: kToolbarHeight,
            right: 24,
            child: TextButton(
              onPressed: () => _skiptoLastPage(exitRouteName: Routes.home),
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                shape: const StadiumBorder(),
                backgroundColor: Palette.primary,
              ),
              onPressed: () => _navigateToNextPage(
                exitsRouteName: Routes.home,
              ),
              child: (_currentPageIndex == onBoardingPages.length - 1)
                  ? const Text(
                      "Continue",
                      style: TextStyle(color: Palette.white),
                    )
                  : const Icon(
                      Icons.arrow_forward_ios,
                      color: Palette.white,
                    ),
            ),
          )
        ],
      ),
    );
  }

  void _updatePageIndicator(int index) {
    setState(() => _currentPageIndex = index);
  }

  /// Skips to the last page of the onboarding flow and navigates to the specified exit route.
  ///
  /// If the current page index is not the last page index, this method jumps to the last page.
  /// Otherwise, it navigates to the specified exit route, removing all previous routes from the navigation stack.
  ///
  /// Parameters:
  /// - [exitRouteName]: The name of the route to navigate to when the last page is reached. Defaults to '/' (the root route).
  void _skiptoLastPage({String exitRouteName = '/'}) async {
    final lastPageIndex = onBoardingPages.length - 1;

    if (_currentPageIndex != lastPageIndex) {
      _pageController.jumpToPage(lastPageIndex);
      return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      exitRouteName,
      (Route<dynamic> route) => route.isFirst,
    );
  }

  /// Navigates to the next page in the onboarding sequence.
  ///
  /// If the current page is the last page in the sequence, it skips to the last page
  /// and exits the onboarding flow using the provided [exitsRouteName].
  ///
  /// Otherwise, it moves to the next page in the sequence using the [_pageController].s
  void _navigateToNextPage({String exitsRouteName = '/'}) {
    if (_currentPageIndex == onBoardingPages.length - 1) {
      _skiptoLastPage(exitRouteName: exitsRouteName);
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
