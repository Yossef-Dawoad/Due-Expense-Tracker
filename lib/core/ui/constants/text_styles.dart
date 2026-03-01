import 'package:flutter/material.dart';

@immutable
class CustomTextStyles extends ThemeExtension<CustomTextStyles> {
  // Display Scale
  final TextStyle displayXL;
  final TextStyle displayLG;
  final TextStyle displayMD;

  // Heading Scale
  final TextStyle headingLG;
  final TextStyle headingMD;

  // Body Scale
  final TextStyle bodyMD;
  final TextStyle bodySM;

  // Utilities
  final TextStyle labelSM;
  final TextStyle caption;
  final TextStyle cta;
  final TextStyle tabLabel;

  const CustomTextStyles({
    this.displayXL = const TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.w800,
      height: 1.1,
      letterSpacing: -0.72,
    ), // -0.02em = -0.72px
    this.displayLG = const TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w800,
      height: 1.1,
      letterSpacing: -0.64,
    ), // -0.02em
    this.displayMD = const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      height: 1.2,
      letterSpacing: -0.24,
    ), // -0.01em
    this.headingLG = const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      height: 1.3,
      letterSpacing: 0,
    ),
    this.headingMD = const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    this.bodyMD = const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    this.bodySM = const TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    this.labelSM = const TextStyle(
      fontSize: 11.0,
      fontWeight: FontWeight.w600,
      height: 1.4,
      letterSpacing: 0.88,
    ), // 0.08em
    this.caption = const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      height: 1.4,
    ),
    this.cta = const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      height: 1.0,
    ),
    this.tabLabel = const TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ), // 0.05em
  });

  @override
  CustomTextStyles copyWith({
    TextStyle? displayXL,
    TextStyle? displayLG,
    TextStyle? displayMD,
    TextStyle? headingLG,
    TextStyle? headingMD,
    TextStyle? bodyMD,
    TextStyle? bodySM,
    TextStyle? labelSM,
    TextStyle? caption,
    TextStyle? cta,
    TextStyle? tabLabel,
  }) {
    return CustomTextStyles(
      displayXL: displayXL ?? this.displayXL,
      displayLG: displayLG ?? this.displayLG,
      displayMD: displayMD ?? this.displayMD,
      headingLG: headingLG ?? this.headingLG,
      headingMD: headingMD ?? this.headingMD,
      bodyMD: bodyMD ?? this.bodyMD,
      bodySM: bodySM ?? this.bodySM,
      labelSM: labelSM ?? this.labelSM,
      caption: caption ?? this.caption,
      cta: cta ?? this.cta,
      tabLabel: tabLabel ?? this.tabLabel,
    );
  }

  @override
  CustomTextStyles lerp(ThemeExtension<CustomTextStyles>? other, double t) {
    if (other is! CustomTextStyles) return this;
    return CustomTextStyles(
      displayXL: TextStyle.lerp(displayXL, other.displayXL, t)!,
      displayLG: TextStyle.lerp(displayLG, other.displayLG, t)!,
      displayMD: TextStyle.lerp(displayMD, other.displayMD, t)!,
      headingLG: TextStyle.lerp(headingLG, other.headingLG, t)!,
      headingMD: TextStyle.lerp(headingMD, other.headingMD, t)!,
      bodyMD: TextStyle.lerp(bodyMD, other.bodyMD, t)!,
      bodySM: TextStyle.lerp(bodySM, other.bodySM, t)!,
      labelSM: TextStyle.lerp(labelSM, other.labelSM, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      cta: TextStyle.lerp(cta, other.cta, t)!,
      tabLabel: TextStyle.lerp(tabLabel, other.tabLabel, t)!,
    );
  }
}
