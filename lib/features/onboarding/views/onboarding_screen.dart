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
  final PageController _pageController = PageController();
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
            itemBuilder: (context, index) {
              final page = onBoardingPages[index];
              return OnBoardingPage(
                image: page.image,
                title: page.title,
                subTitle: page.subTitle,
              );
            },
          ),

          /// skip Button
          Positioned(
            top: kToolbarHeight,
            right: 24,
            child: TextButton(
              onPressed: () => _skiptoLastPage(exitRouteName: Routes.home),
              child: const Text('skip'),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                shape: const StadiumBorder(),
                backgroundColor: Palette.primary,
              ),
              onPressed: () => _navigateToNextPage(
                exitsRouteName: Routes.home,
              ),
              child: (_currentPageIndex == onBoardingPages.length - 1)
                  ? const Text(
                      "continue",
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

  void _navigateToNextPage({String exitsRouteName = '/'}) {
    if (_currentPageIndex == onBoardingPages.length - 1) {
      _skiptoLastPage(exitRouteName: exitsRouteName);
      return;
    }
    _pageController.nextPage(
      duration: const Duration(microseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
