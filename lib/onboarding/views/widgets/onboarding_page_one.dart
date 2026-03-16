import 'dart:ui';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/animation/animation.dart';
import 'package:flutter/material.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: isDark ? context.kitColors.bgBase : Colors.white,
      child: Stack(
        children: [
          _buildAmbientShadow(
            context,
            color: context
                .kitColors
                .brandPrimary, // #39E079 mapped to brandPrimary
            top: -0.1,
            left: -0.1,
            size: MediaQuery.of(context).size.width * 0.8,
          ),
          _buildAmbientShadow(
            context,
            color: const Color(0xFF581c87), // #581c87
            top: 0.4,
            right: -0.2,
            size: MediaQuery.of(context).size.width * 0.9,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing.s8, // ~32px, px-8
              ),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  FadeInAnimation(
                    child: SlideInAnimation(
                      beginOffset: const Offset(0, 0.2),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: context.textStyles.displayXL.copyWith(
                            color: context.kitColors.textPrimary, // #0e1a13
                            textBaseline: TextBaseline.alphabetic,
                          ),
                          children: [
                            const TextSpan(text: 'MASTER YOUR\n'),
                            TextSpan(
                              text: 'MONEY',
                              style: context.textStyles.displayXL.copyWith(
                                color: context
                                    .kitColors
                                    .brandPrimary, // text-primary
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const SlideInAnimation(
                    beginOffset: Offset(0, 0.1),
                    delay: Duration(milliseconds: 100),
                    child: _FloatingCardScene(),
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
                          'Track your spending, set budgets, and grow your wealth with ease.',
                          textAlign: TextAlign.center,
                          style: context.textStyles.headingMD.copyWith(
                            color: context.kitColors.textTertiary.withValues(
                              alpha: 0.7,
                            ), // #0e1a13/70
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
        ],
      ),
    );
  }

  Widget _buildAmbientShadow(
    BuildContext context, {
    required Color color,
    double? top,
    double? left,
    double? right,
    required double size,
  }) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      top: top != null ? screenSize.height * top : null,
      left: left != null ? screenSize.width * left : null,
      right: right != null ? screenSize.width * right : null,
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color.withValues(alpha: 0.15), Colors.transparent],
            stops: const [0.0, 0.7],
          ),
        ),
      ),
    );
  }
}

class _FloatingCardScene extends StatelessWidget {
  const _FloatingCardScene();

  @override
  Widget build(BuildContext context) {
    // max-w-[320px] aspect-square w-full
    final width = MediaQuery.of(context).size.width;
    final size = (width * 0.8).clamp(240.0, 320.0);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip
            .none, // FIXED: Allows coins to bleed outside the 320px bounding box
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: 0.1047, // 6 degrees
            child: Transform.scale(
              scale: 0.95,
              child: Opacity(
                opacity: 0.5,
                child: _buildGlassContainer(
                  context,
                  size: size,
                  showBlur: false,
                ),
              ),
            ),
          ),
          _buildGlassContainer(context, size: size),
          HoverDanceAnimation(
            duration: const Duration(milliseconds: 3000),
            verticalOffset: -8,
            child: const _FloatingCreditCard(),
          ),
          Positioned(
            right: -16, // Fixed: Negative right offset needs Clip.none on Stack
            child: HoverDanceAnimation(
              duration: const Duration(milliseconds: 2500),
              verticalOffset: -12,
              child: const _FloatingCoin(
                icon: Icons.attach_money,
                size: 64, // size-16
                colors: [Color(0xFFFFD700), Color(0xFFD4AF37)],
                iconSize: 36, // 3xl
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            child: HoverDanceAnimation(
              duration: const Duration(milliseconds: 3500),
              verticalOffset: -8,
              child: Transform.rotate(
                angle: -0.2094, // -12 degrees
                child: const _FloatingCoin(
                  icon: Icons.payments,
                  size: 48, // size-12
                  colors: [Color(0xFFFFD700), Color(0xFFB8860B)],
                  iconSize: 20, // xl
                ),
              ),
            ),
          ),
          Positioned(
            top: 48,
            left: 40,
            child: HoverDanceAnimation(
              duration: const Duration(milliseconds: 2800),
              verticalOffset: -10,
              child: Transform.rotate(
                angle: 0.785, // 45 degrees
                child: Opacity(
                  opacity: 0.8,
                  child: const _FloatingCoin(
                    colors: [Color(0xFFFFD700), Color(0xFFDAA520)],
                    size: 32, // size-8
                    iconSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassContainer(
    BuildContext context, {
    required double size,
    bool showBlur = true,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withValues(alpha: 0.08)
            : Colors.white.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(48),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withValues(alpha: 0.15)
              : Colors.white.withValues(alpha: 0.3),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x121F2687), // 0 8px 32px 0 rgba(31, 38, 135, 0.07)
            blurRadius: 32,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: RepaintBoundary(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(48),
          child: showBlur
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: const SizedBox.shrink(),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _FloatingCreditCard extends StatelessWidget {
  const _FloatingCreditCard();

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective(1000px)
        ..rotateY(-0.26) // -15 degrees
        ..rotateX(0.17), // 10 degrees
      alignment: Alignment.center,
      child: Container(
        width: 192, // w-48
        height: 128, // h-32
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1E3A8A), Color(0xFF581C87)], // 135deg
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26, // shadow-2xl equivalent loosely inferred
              blurRadius: 24,
              offset: Offset(0, 12),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Icon(
                      Icons.contactless,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 6,
                      width: 96,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 6), // space-y-1
                    Container(
                      height: 6,
                      width: 64,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
                child: RepaintBoundary(
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4), // blur-sm
                      child: const SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FloatingCoin extends StatelessWidget {
  const _FloatingCoin({
    this.icon,
    required this.size,
    required this.colors,
    required this.iconSize,
  });

  final IconData? icon;
  final double size;
  final double iconSize;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.4),
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12, // shadow-lg equivalent loosely inferred
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: icon != null
          ? Icon(icon, size: iconSize, color: Colors.white)
          : null,
    );
  }
}
