import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/common/widgets/glass_card.dart';
import 'package:expancetracker/animation/animation.dart';
import 'package:flutter/material.dart';

class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? const Color(0xFF122017) // background-dark
        : const Color(0xFFF6F8F7); // background-light
    final textColor = isDark ? Colors.white : context.kitColors.textPrimary;

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
              const _SecureShieldScene(),
              const Spacer(),
              FadeInAnimation(
                child: SlideInAnimation(
                  beginOffset: const Offset(0, 0.2),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: context.textStyles.displayXL.copyWith(
                        color: textColor,
                        height: 1.0,
                        letterSpacing: -1.0,
                      ),
                      children: [
                        const TextSpan(text: 'SECURE &\n'),
                        TextSpan(
                          text: 'PRIVATE',
                          style: context.textStyles.displayXL.copyWith(
                            color: const Color(0xFF39E079),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FadeInAnimation(
                delay: const Duration(milliseconds: 200),
                child: SlideInAnimation(
                  beginOffset: const Offset(0, 0.2),
                  delay: const Duration(milliseconds: 200),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.spacing.s4,
                        ),
                        child: Text(
                          'Your data is encrypted and protected with bank-level security.',
                          textAlign: TextAlign.center,
                          style: context.textStyles.bodyMD.copyWith(
                            color: textColor.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w500, // font-medium
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.lock,
                            color: Color(0xFF39E079), // text-primary
                            size: 14, // text-sm
                          ),
                          const SizedBox(width: 8), // gap-2
                          Text(
                            'AES-256 Encryption'.toUpperCase(),
                            style: context.textStyles.labelSM.copyWith(
                              fontSize: 10, // text-[10px]
                              fontWeight: FontWeight.bold, // font-bold
                              letterSpacing: 2.0, // tracking-[0.2em]
                              color: textColor.withValues(
                                alpha: 0.5,
                              ), // opacity-50
                            ),
                          ),
                        ],
                      ),
                    ],
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

class _SecureShieldScene extends StatelessWidget {
  const _SecureShieldScene();

  @override
  Widget build(BuildContext context) {
    // Determine dynamic background based on theme brightness. In HTML light mode it's f6f8f7, dark is 122017
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final width = MediaQuery.of(context).size.width;
    final size = (width * 0.7).clamp(240.0, 280.0);

    return SizedBox(
      width: size + 48, // pad for absolute badges
      height: size + 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Blob (blur-3xl scale-75)
          Container(
            width: size * 0.75,
            height: size * 0.75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF39E079).withValues(
                alpha: isDark ? 0.05 : 0.10,
              ), // bg-primary/10 dark:bg-primary/5
              boxShadow: [
                BoxShadow(
                  color: const Color(
                    0xFF39E079,
                  ).withValues(alpha: isDark ? 0.05 : 0.10),
                  blurRadius: 40, // blur-3xl approximation
                  spreadRadius: 20,
                ),
              ],
            ),
          ),

          // Dashed Ring (w-[280px] h-[280px])
          Container(
            width: size, // bounding clamp works perfectly
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(
                  0xFF39E079,
                ).withValues(alpha: 0.2), // border-primary/20
                width: 2,
                // Note: Standard Flutter doesn't support dashed borders natively without CustomPaint,
                // keeping solid for performance unless strictly necessary.
              ),
            ),
          ),

          // Central Glass Shield Container (w-48 h-56 rounded-[2.5rem])
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: AnimationDurations.longer,
            curve: Curves.elasticOut,
            builder: (context, value, child) {
              return Transform.scale(scale: value, child: child);
            },
            child: Container(
              width: 192, // w-48
              height: 224, // h-56
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), // rounded-[2.5rem]
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF39E079).withValues(
                      alpha: 0.3,
                    ), // filter: drop-shadow(0 20px 30px rgba(57, 224, 121, 0.3));
                    offset: const Offset(0, 20),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: GlassCard(
                borderRadius: BorderRadius.circular(40),
                padding: EdgeInsets.zero,
                color: isDark
                    ? Colors.white.withValues(alpha: 0.05)
                    : Colors.white.withValues(alpha: 0.4),
                borderColor: isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.white.withValues(alpha: 0.5),
                child: Center(
                  child: Container(
                    width: 96, // w-24
                    height: 96, // h-24
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF39E079),
                          Color(0xFF3B82F6),
                        ], // from-primary to-secondary
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: 0.2,
                          ), // shadow-xl
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.shield_outlined, // Closer to the HTML shield icon
                      color: Colors.white,
                      size: 48, // text-5xl (48px)
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Floating Badges - Positioned must be direct child of Stack
          Positioned(
            top: 24, // -top-4 relative to container center
            right: 0, // -right-4 relative to container center
            child: FadeInAnimation(
              delay: const Duration(milliseconds: 300),
              child: SlideInAnimation(
                beginOffset: const Offset(1.0, 0.0),
                delay: const Duration(milliseconds: 300),
                child: _FloatingBadgeIcon(
                  icon: Icons.fingerprint,
                  iconColor: const Color(0xFF39E079), // text-primary
                  size: 56, // size-14
                  iconSize: 24, // text-2xl
                  isDark: isDark,
                  borderRadius: 16, // rounded-2xl
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 40, // bottom-10
            left: 0, // -left-6
            child: FadeInAnimation(
              delay: const Duration(milliseconds: 400),
              child: SlideInAnimation(
                beginOffset: const Offset(-1.0, 0.0),
                delay: const Duration(milliseconds: 400),
                child: _FloatingBadgeIcon(
                  icon: Icons.key,
                  iconColor: const Color(0xFF3B82F6), // text-secondary
                  size: 48, // size-12
                  iconSize: 20, // text-xl (20px)
                  isDark: isDark,
                  borderRadius: 12, // rounded-xl
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingBadgeIcon extends StatelessWidget {
  const _FloatingBadgeIcon({
    required this.icon,
    required this.iconColor,
    required this.size,
    required this.iconSize,
    required this.isDark,
    required this.borderRadius,
  });

  final IconData icon;
  final Color iconColor;
  final double size;
  final double iconSize;
  final bool isDark;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), // shadow-lg
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: GlassCard(
        borderRadius: BorderRadius.circular(borderRadius),
        padding: EdgeInsets.zero,
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.white.withValues(alpha: 0.4),
        borderColor: isDark
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.white.withValues(alpha: 0.5),
        child: Center(
          child: Icon(icon, color: iconColor, size: iconSize),
        ),
      ),
    );
  }
}
