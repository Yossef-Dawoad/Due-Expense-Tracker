import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:expancetracker/onboarding/viewmodels/onboarding_view_model.dart';
import 'package:expancetracker/core/common/widgets/animated_gradient_button.dart';
import 'package:expancetracker/animation/animation.dart';
import 'package:flutter/material.dart';

import 'widgets/indicator.dart';
import 'widgets/onboarding_page_one.dart';
import 'widgets/onboarding_page_two.dart';
import 'widgets/onboarding_page_three.dart';

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

  static const int _pageCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    _viewModel.dipose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          /// horizontal scrollable custom pages
          PageView(
            controller: _pageController,
            onPageChanged: _viewModel.updatePageIndicator,
            children: const [
              OnboardingPageOne(),
              OnboardingPageTwo(),
              OnboardingPageThree(),
            ],
          ),

          /// Header Area (Navigation & Indicators)
          Positioned(
            top: kToolbarHeight,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button (hidden on page 1)
                ValueListenableBuilder<int>(
                  valueListenable: _viewModel.currentPageIndex,
                  builder: (context, currentIndex, _) {
                    return Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: currentIndex > 0,
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left, size: 32),
                        color: context.kitColors.textPrimary,
                        onPressed: _navigateToPreviousPage,
                      ),
                    );
                  },
                ),
                // Dot Indicators (Fades in on last page scroll)
                AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    final page =
                        _pageController.hasClients &&
                            _pageController.position.haveDimensions
                        ? (_pageController.page ?? 0.0)
                        : 0.0;
                    final progress = (page - 1.0).clamp(0.0, 1.0);

                    return IgnorePointer(
                      ignoring: progress < 0.5,
                      child: Opacity(
                        opacity: progress,
                        child: Transform.translate(
                          offset: Offset(
                            0,
                            -20 * (1.0 - progress),
                          ), // Slides down into place
                          child: child,
                        ),
                      ),
                    );
                  },
                  child: Indicator(
                    count: _pageCount,
                    controller: _pageController,
                    dotHeight: 6.0,
                  ),
                ),
                // Skip Button (Fades out on last page scroll)
                AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    final page =
                        _pageController.hasClients &&
                            _pageController.position.haveDimensions
                        ? (_pageController.page ?? 0.0)
                        : 0.0;
                    final progress = (page - 1.0).clamp(0.0, 1.0);

                    return IgnorePointer(
                      ignoring: progress > 0.5,
                      child: Opacity(
                        opacity: 1.0 - progress,
                        child: Transform.translate(
                          offset: Offset(
                            0,
                            -20 * progress,
                          ), // Slides up and away
                          child: child,
                        ),
                      ),
                    );
                  },
                  child: TextButton(
                    onPressed: _skipToLastPage,
                    child: Text(
                      'Skip',
                      style: context.textStyles.bodyMD.copyWith(
                        color: context.kitColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Custom Footer Navigation based on page index
          Positioned(
            bottom: kBottomNavigationBarHeight,
            left: 24,
            right: 24,
            child: AnimatedBuilder(
              animation: _pageController,
              builder: (context, _) {
                final page =
                    _pageController.hasClients &&
                        _pageController.position.haveDimensions
                    ? (_pageController.page ?? 0.0)
                    : 0.0;

                // Transition from page 1 to 2 (index 1 to 2)
                final progress = (page - 1.0).clamp(0.0, 1.0);

                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Next Button & Indicators (Fades out and slides down)
                    if (progress < 1.0)
                      IgnorePointer(
                        ignoring: progress > 0.5,
                        child: Opacity(
                          opacity: 1.0 - progress,
                          child: Transform.translate(
                            offset: Offset(0, 20 * progress),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Indicator(
                                  count: _pageCount,
                                  controller: _pageController,
                                  dotHeight: 8.0,
                                ),
                                const SizedBox(height: 32),
                                _buildNextButton(context),
                              ],
                            ),
                          ),
                        ),
                      ),

                    // Get Started Section (Fades in and slides up)
                    if (progress > 0.0)
                      IgnorePointer(
                        ignoring: progress < 0.5,
                        child: Opacity(
                          opacity: progress,
                          child: Transform.translate(
                            offset: Offset(0, 20 * (1.0 - progress)),
                            child: _buildGetStartedSection(context),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return AnimatedGradientButton(
      onPressed: _navigateToNextPage,
      gradient: LinearGradient(
        colors: [
          context.kitColors.brandPrimary,
          context.kitColors.brandPrimary,
        ],
      ),
      shadowColor: context.kitColors.brandPrimary.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(24),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Next',
            style: context.textStyles.cta.copyWith(
              color: context.kitColors.textOnPrimary,
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.arrow_forward,
            color: context.kitColors.textOnPrimary,
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildGetStartedSection(BuildContext context) {
    return Column(
      children: [
        AnimatedGradientButton(
          onPressed: _viewModel.completeOnboarding,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF39E079), Color(0xFF3B82F6)],
          ),
          shadowColor: const Color(0xFF39E079).withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(16),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started',
                style: context.textStyles.cta.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'By tapping Get Started, you agree to our Terms of Service',
          style: context.textStyles.caption.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: context.kitColors.textSecondary.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }

  void _skipToLastPage() {
    _pageController.jumpToPage(_pageCount - 1);
  }

  void _navigateToNextPage() {
    _pageController.nextPage(
      duration: AnimationDurations.medium,
      curve: Curves.easeInOutCubic,
    );
  }

  void _navigateToPreviousPage() {
    _pageController.previousPage(
      duration: AnimationDurations.medium,
      curve: Curves.easeInOutCubic,
    );
  }
}
