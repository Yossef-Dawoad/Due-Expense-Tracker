import 'package:flutter/material.dart';

@immutable
class CustomBorderRadius extends ThemeExtension<CustomBorderRadius> {
  // Base Scale
  final BorderRadius none;
  final BorderRadius sm;
  final BorderRadius md;
  final BorderRadius lg;
  final BorderRadius xl;
  final BorderRadius xxl;
  final BorderRadius xtreme;
  final BorderRadius pill;
  final BorderRadius circle;

  // Semantic
  final BorderRadius card;
  final BorderRadius button;
  final BorderRadius input;
  final BorderRadius chip;
  final BorderRadius badge;
  final BorderRadius avatar;
  final BorderRadius fab;
  final BorderRadius progressBar;
  final BorderRadius toggle;
  final BorderRadius iconContainer;

  const CustomBorderRadius({
    this.none = BorderRadius.zero,
    this.sm = const BorderRadius.all(Radius.circular(8.0)),
    this.md = const BorderRadius.all(Radius.circular(12.0)),
    this.lg = const BorderRadius.all(Radius.circular(16.0)),
    this.xl = const BorderRadius.all(Radius.circular(20.0)),
    this.xxl = const BorderRadius.all(Radius.circular(28.0)),
    this.xtreme = const BorderRadius.all(Radius.circular(38.0)),
    this.pill = const BorderRadius.all(Radius.circular(999.0)),
    // In Flutter, circle is often better achieved via Shape (CircleBorder) but we can provide a large radius
    this.circle = const BorderRadius.all(Radius.circular(9999.0)),

    // Semantic maps
    this.card = const BorderRadius.all(Radius.circular(16.0)),
    this.button = const BorderRadius.all(Radius.circular(16.0)),
    this.input = const BorderRadius.all(Radius.circular(12.0)),
    this.chip = const BorderRadius.all(Radius.circular(12.0)),
    this.badge = const BorderRadius.all(Radius.circular(999.0)),
    this.avatar = const BorderRadius.all(Radius.circular(9999.0)),
    this.fab = const BorderRadius.all(Radius.circular(9999.0)),
    this.progressBar = const BorderRadius.all(Radius.circular(999.0)),
    this.toggle = const BorderRadius.all(Radius.circular(999.0)),
    this.iconContainer = const BorderRadius.all(Radius.circular(12.0)),
  });

  @override
  CustomBorderRadius copyWith({
    BorderRadius? none,
    BorderRadius? sm,
    BorderRadius? md,
    BorderRadius? lg,
    BorderRadius? xl,
    BorderRadius? pill,
    BorderRadius? circle,
    BorderRadius? card,
    BorderRadius? button,
    BorderRadius? input,
    BorderRadius? chip,
    BorderRadius? badge,
    BorderRadius? avatar,
    BorderRadius? fab,
    BorderRadius? progressBar,
    BorderRadius? toggle,
    BorderRadius? iconContainer,
  }) {
    return CustomBorderRadius(
      none: none ?? this.none,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      pill: pill ?? this.pill,
      circle: circle ?? this.circle,
      card: card ?? this.card,
      button: button ?? this.button,
      input: input ?? this.input,
      chip: chip ?? this.chip,
      badge: badge ?? this.badge,
      avatar: avatar ?? this.avatar,
      fab: fab ?? this.fab,
      progressBar: progressBar ?? this.progressBar,
      toggle: toggle ?? this.toggle,
      iconContainer: iconContainer ?? this.iconContainer,
    );
  }

  @override
  CustomBorderRadius lerp(ThemeExtension<CustomBorderRadius>? other, double t) {
    if (other is! CustomBorderRadius) return this;
    return CustomBorderRadius(
      none: BorderRadius.lerp(none, other.none, t)!,
      sm: BorderRadius.lerp(sm, other.sm, t)!,
      md: BorderRadius.lerp(md, other.md, t)!,
      lg: BorderRadius.lerp(lg, other.lg, t)!,
      xl: BorderRadius.lerp(xl, other.xl, t)!,
      pill: BorderRadius.lerp(pill, other.pill, t)!,
      circle: BorderRadius.lerp(circle, other.circle, t)!,
      card: BorderRadius.lerp(card, other.card, t)!,
      button: BorderRadius.lerp(button, other.button, t)!,
      input: BorderRadius.lerp(input, other.input, t)!,
      chip: BorderRadius.lerp(chip, other.chip, t)!,
      badge: BorderRadius.lerp(badge, other.badge, t)!,
      avatar: BorderRadius.lerp(avatar, other.avatar, t)!,
      fab: BorderRadius.lerp(fab, other.fab, t)!,
      progressBar: BorderRadius.lerp(progressBar, other.progressBar, t)!,
      toggle: BorderRadius.lerp(toggle, other.toggle, t)!,
      iconContainer: BorderRadius.lerp(iconContainer, other.iconContainer, t)!,
    );
  }
}
