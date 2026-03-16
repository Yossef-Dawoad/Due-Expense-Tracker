import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/common/widgets/glass_card.dart';
import 'package:expancetracker/animation/animation.dart';
import 'package:flutter/material.dart';

class OnboardingPageTwo extends StatelessWidget {
  const OnboardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? const Color(0xFF122017) // #122017 background-dark
        : const Color(0xFFF6F8F7); // #f6f8f7 background-light
    final textColor = isDark
        ? Colors.white
        : context.kitColors.textPrimary; // #0e1a13

    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing.s6,
            vertical: context.spacing.s8,
          ),
          child: Column(
            children: [
              const Spacer(flex: 2),
              FadeInAnimation(
                child: SlideInAnimation(
                  beginOffset: const Offset(0, 0.2),
                  child: Text(
                    'INSIGHTFUL\nANALYTICS',
                    textAlign: TextAlign.center,
                    style: context.textStyles.displayXL.copyWith(
                      color: textColor,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const SlideInAnimation(
                beginOffset: Offset(0, 0.1),
                delay: Duration(milliseconds: 100),
                child: _GlowingChartScene(),
              ),
              const SizedBox(height: 48),
              FadeInAnimation(
                delay: const Duration(milliseconds: 200),
                child: SlideInAnimation(
                  beginOffset: const Offset(0, 0.2),
                  delay: const Duration(milliseconds: 200),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.spacing.s4,
                    ),
                    child: Text(
                      'Get clear visual reports of your financial habits and spending trends.',
                      textAlign: TextAlign.center,
                      style: context.textStyles.headingMD.copyWith(
                        color: context.kitColors.textTertiary.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlowingChartScene extends StatelessWidget {
  const _GlowingChartScene();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final size = (width * 0.7).clamp(240.0, 280.0);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final cardBgColor = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : Colors.black.withValues(alpha: 0.03);
    final cardBorderColor = isDark
        ? Colors.white.withValues(alpha: 0.3)
        : Colors.black.withValues(alpha: 0.08);

    final highlightBg = isDark
        ? Colors.white.withValues(alpha: 0.2)
        : Colors.black.withValues(alpha: 0.05);
    final highlightFadedBg = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : Colors.black.withValues(alpha: 0.03);

    return SizedBox(
      width: size + 32, // pad for absolute badges
      height: size + 32,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Illustration Blob Background
          Container(
            width: size * 0.9,
            height: size * 0.9,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0x2639E079), // primary green at 15% alpha
                  Color(0x1A581C87), // secondary purple at 10% alpha
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x2639E079),
                  blurRadius: 40,
                  spreadRadius: 20,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 16,
            child: Container(
              width: size * 0.6,
              height: size * 0.6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x0D39E079), // 0.05 alpha
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0D39E079),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),

          // Main Chart Card
          SizedBox(
            width: size,
            height: size,
            child: GlassCard(
              color: cardBgColor,
              borderColor: cardBorderColor,
              borderRadius: BorderRadius.circular(40),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: context.kitColors.brandPrimary.withValues(
                            alpha: 0.2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.trending_up,
                          color: context.kitColors.brandPrimary,
                          size: 16,
                        ),
                      ),
                      Container(
                        height: 6,
                        width: 48,
                        decoration: BoxDecoration(
                          color: highlightBg,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Chart Bars
                  SizedBox(
                    height: size * 0.45,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _ChartBar(heightPercentage: 0.4, isHighlighted: false),
                        _ChartBar(heightPercentage: 0.6, isHighlighted: false),
                        _ChartBar(heightPercentage: 0.85, isHighlighted: true),
                        _ChartBar(heightPercentage: 0.5, isHighlighted: false),
                        _ChartBar(heightPercentage: 0.7, isHighlighted: false),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 64,
                        decoration: BoxDecoration(
                          color: highlightFadedBg,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        height: 12,
                        width: 32,
                        decoration: BoxDecoration(
                          color: highlightFadedBg,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Floating Badges
          Positioned(
            top: size * 0.25,
            right: 0,
            child: HoverDanceAnimation(
              duration: const Duration(milliseconds: 2500),
              verticalOffset: -6,
              child: _FloatingBadge(
                text: '+24%',
                badgeColor: isDark ? null : Colors.white,
                borderColor: isDark
                    ? null
                    : Colors.black.withValues(alpha: 0.05),
                textColor: isDark
                    ? const Color(0xFF39E079)
                    : context.kitColors.brandPrimaryDark, // primary green
              ),
            ),
          ),
          Positioned(
            bottom: size * 0.25,
            left: 0,
            child: HoverDanceAnimation(
              duration: const Duration(milliseconds: 3000),
              verticalOffset: 6,
              child: _FloatingBadge(
                text: 'GROWTH',
                badgeColor: isDark ? null : Colors.white,
                borderColor: isDark
                    ? context.kitColors.brandPrimary
                    : Colors.black.withValues(alpha: 0.05),
                textColor: isDark
                    ? context.kitColors.brandPrimary
                    : context.kitColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartBar extends StatelessWidget {
  const _ChartBar({
    required this.heightPercentage,
    required this.isHighlighted,
  });

  final double heightPercentage;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: heightPercentage),
          duration: AnimationDurations.longer,
          curve: Curves.elasticOut,
          builder: (context, value, child) {
            return FractionallySizedBox(
              heightFactor: value,
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  color: isHighlighted
                      ? null
                      : (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white.withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.05)),
                  gradient: isHighlighted
                      ? const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xFF39E079), Color(0xFF5EEAD4)],
                        )
                      : null,
                  boxShadow: isHighlighted
                      ? [
                          BoxShadow(
                            color: const Color(
                              0xFF39E079,
                            ).withValues(alpha: 0.4),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: Offset.zero,
                          ),
                        ]
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FloatingBadge extends StatelessWidget {
  const _FloatingBadge({
    required this.text,
    required this.textColor,
    this.badgeColor,
    this.borderColor,
  });

  final String text;
  final Color textColor;
  final Color? badgeColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      borderRadius: BorderRadius.circular(16),
      color: badgeColor,
      borderColor: borderColor,
      child: Text(
        text,
        style: context.textStyles.labelSM.copyWith(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.w800, // extrabold
          letterSpacing: 2.0, // tracking-widest (~2.0px)
        ),
      ),
    );
  }
}
