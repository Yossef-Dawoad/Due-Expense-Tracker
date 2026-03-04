import 'package:flutter/material.dart';

@immutable
class KitColorsExtension extends ThemeExtension<KitColorsExtension> {
  // Brand
  final Color brandPrimary;
  final Color brandPrimaryLight;
  final Color brandPrimaryDark;

  // Semantic
  final Color semanticPositive;
  final Color semanticNegative;
  final Color semanticNeutral;

  // Background
  final Color bgBase;
  final Color bgSurface;
  final Color bgSurfaceSecondary;
  final Color bgOverlay;

  // Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textPlaceholder;
  final Color textOnPrimary;
  final Color textLink;

  // Border
  final Color borderDefault;
  final Color borderLight;
  final Color borderSelected;
  final Color borderFocus;

  // Chart
  final Color chartLineColor;
  final Color chartLineFill;
  final Color chartProgressBar;
  final Color chartProgressTrack;

  // Notification
  final Color notificationBadge;

  const KitColorsExtension({
    this.brandPrimary = KitColors.brandPrimary,
    this.brandPrimaryLight = KitColors.brandPrimaryLight,
    this.brandPrimaryDark = KitColors.brandPrimaryDark,
    this.semanticPositive = KitColors.semanticPositive,
    this.semanticNegative = KitColors.semanticNegative,
    this.semanticNeutral = KitColors.semanticNeutral,
    this.bgBase = KitColors.bgBase,
    this.bgSurface = KitColors.bgSurface,
    this.bgSurfaceSecondary = KitColors.bgSurfaceSecondary,
    this.bgOverlay = KitColors.bgOverlay,
    this.textPrimary = KitColors.textPrimary,
    this.textSecondary = KitColors.textSecondary,
    this.textTertiary = KitColors.textTertiary,
    this.textPlaceholder = KitColors.textPlaceholder,
    this.textOnPrimary = KitColors.textOnPrimary,
    this.textLink = KitColors.textLink,
    this.borderDefault = KitColors.borderDefault,
    this.borderLight = KitColors.borderLight,
    this.borderSelected = KitColors.borderSelected,
    this.borderFocus = KitColors.borderFocus,
    this.chartLineColor = KitColors.chartLineColor,
    this.chartLineFill = KitColors.chartLineFill,
    this.chartProgressBar = KitColors.chartProgressBar,
    this.chartProgressTrack = KitColors.chartProgressTrack,
    this.notificationBadge = KitColors.notificationBadge,
  });

  @override
  ThemeExtension<KitColorsExtension> copyWith({
    Color? brandPrimary,
    Color? brandPrimaryLight,
    Color? brandPrimaryDark,
    Color? semanticPositive,
    Color? semanticNegative,
    Color? semanticNeutral,
    Color? bgBase,
    Color? bgSurface,
    Color? bgSurfaceSecondary,
    Color? bgOverlay,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textPlaceholder,
    Color? textOnPrimary,
    Color? textLink,
    Color? borderDefault,
    Color? borderLight,
    Color? borderSelected,
    Color? borderFocus,
    Color? chartLineColor,
    Color? chartLineFill,
    Color? chartProgressBar,
    Color? chartProgressTrack,
    Color? notificationBadge,
  }) {
    return KitColorsExtension(
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandPrimaryLight: brandPrimaryLight ?? this.brandPrimaryLight,
      brandPrimaryDark: brandPrimaryDark ?? this.brandPrimaryDark,
      semanticPositive: semanticPositive ?? this.semanticPositive,
      semanticNegative: semanticNegative ?? this.semanticNegative,
      semanticNeutral: semanticNeutral ?? this.semanticNeutral,
      bgBase: bgBase ?? this.bgBase,
      bgSurface: bgSurface ?? this.bgSurface,
      bgSurfaceSecondary: bgSurfaceSecondary ?? this.bgSurfaceSecondary,
      bgOverlay: bgOverlay ?? this.bgOverlay,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textPlaceholder: textPlaceholder ?? this.textPlaceholder,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
      textLink: textLink ?? this.textLink,
      borderDefault: borderDefault ?? this.borderDefault,
      borderLight: borderLight ?? this.borderLight,
      borderSelected: borderSelected ?? this.borderSelected,
      borderFocus: borderFocus ?? this.borderFocus,
      chartLineColor: chartLineColor ?? this.chartLineColor,
      chartLineFill: chartLineFill ?? this.chartLineFill,
      chartProgressBar: chartProgressBar ?? this.chartProgressBar,
      chartProgressTrack: chartProgressTrack ?? this.chartProgressTrack,
      notificationBadge: notificationBadge ?? this.notificationBadge,
    );
  }

  @override
  ThemeExtension<KitColorsExtension> lerp(
    covariant ThemeExtension<KitColorsExtension>? other,
    double t,
  ) {
    if (other is! KitColorsExtension) {
      return this;
    }
    return KitColorsExtension(
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t)!,
      brandPrimaryLight: Color.lerp(
        brandPrimaryLight,
        other.brandPrimaryLight,
        t,
      )!,
      brandPrimaryDark: Color.lerp(
        brandPrimaryDark,
        other.brandPrimaryDark,
        t,
      )!,
      semanticPositive: Color.lerp(
        semanticPositive,
        other.semanticPositive,
        t,
      )!,
      semanticNegative: Color.lerp(
        semanticNegative,
        other.semanticNegative,
        t,
      )!,
      semanticNeutral: Color.lerp(semanticNeutral, other.semanticNeutral, t)!,
      bgBase: Color.lerp(bgBase, other.bgBase, t)!,
      bgSurface: Color.lerp(bgSurface, other.bgSurface, t)!,
      bgSurfaceSecondary: Color.lerp(
        bgSurfaceSecondary,
        other.bgSurfaceSecondary,
        t,
      )!,
      bgOverlay: Color.lerp(bgOverlay, other.bgOverlay, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textPlaceholder: Color.lerp(textPlaceholder, other.textPlaceholder, t)!,
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
      textLink: Color.lerp(textLink, other.textLink, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderLight: Color.lerp(borderLight, other.borderLight, t)!,
      borderSelected: Color.lerp(borderSelected, other.borderSelected, t)!,
      borderFocus: Color.lerp(borderFocus, other.borderFocus, t)!,
      chartLineColor: Color.lerp(chartLineColor, other.chartLineColor, t)!,
      chartLineFill: Color.lerp(chartLineFill, other.chartLineFill, t)!,
      chartProgressBar: Color.lerp(
        chartProgressBar,
        other.chartProgressBar,
        t,
      )!,
      chartProgressTrack: Color.lerp(
        chartProgressTrack,
        other.chartProgressTrack,
        t,
      )!,
      notificationBadge: Color.lerp(
        notificationBadge,
        other.notificationBadge,
        t,
      )!,
    );
  }
}

class KitColors {
  const KitColors._();

  // Brand
  static const brandPrimary = Color(0xFF22C55E);
  static const brandPrimaryLight = Color(0xFFDCFCE7);
  static const brandPrimaryDark = Color(0xFF16A34A);

  // Semantic
  static const semanticPositive = Color(0xFF22C55E);
  static const semanticNegative = Color(0xFFEF4444);
  static const semanticNeutral = Color(0xFF6B7280);

  // Background
  static const bgBase = Color(0xFFF8FAF8);
  static const bgSurface = Color(0xFFFFFFFF);
  static const bgSurfaceSecondary = Color(0xFFF3F4F6);
  static const bgOverlay = Color(0x0A000000); // approx rgba(0, 0, 0, 0.04)

  // Text
  static const textPrimary = Color(0xFF0F172A);
  static const textSecondary = Color(0xFF374151);
  static const textTertiary = Color(0xFF6B7280);
  static const textPlaceholder = Color(0xFF9CA3AF);
  static const textOnPrimary = Color(0xFF0F172A);
  static const textLink = Color(0xFF22C55E);

  // Border
  static const borderDefault = Color(0xFFE5E7EB);
  static const borderLight = Color(
    0xFFF3F4F6,
  ); // Very subtle, for cards/containers
  static const borderSelected = Color(0xFF22C55E);
  static const borderFocus = Color(0xFF22C55E);

  // Chart
  static const chartLineColor = Color(0xFF7C3AED);
  static const chartLineFill = Color(
    0x147C3AED,
  ); // approx rgba(124, 58, 237, 0.08)
  static const chartProgressBar = Color(0xFF22C55E);
  static const chartProgressTrack = Color(0xFFE5E7EB);

  // Notification
  static const notificationBadge = Color(0xFFEF4444);
}
