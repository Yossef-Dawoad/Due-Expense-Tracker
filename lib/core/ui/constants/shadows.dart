import 'package:flutter/material.dart';

@immutable
class CustomShadows extends ThemeExtension<CustomShadows> {
  // Elevation mapped to new Tokens
  final List<BoxShadow> none;
  final List<BoxShadow> elevation1; // Cards, lists
  final List<BoxShadow> elevation2; // Elevated cards
  final List<BoxShadow> elevation3; // FAB
  final List<BoxShadow> modal; // Bottom sheet

  // Helper colors based on the design token definitions
  static const _shadowColor06 = Color.fromRGBO(0, 0, 0, 0.06);
  static const _shadowColor04 = Color.fromRGBO(0, 0, 0, 0.04);
  static const _shadowColor08 = Color.fromRGBO(0, 0, 0, 0.08);
  static const _shadowColorPrimary30 = Color.fromRGBO(
    34,
    197,
    94,
    0.30,
  ); // Primary green
  static const _shadowColorModal = Color.fromRGBO(0, 0, 0, 0.15);

  const CustomShadows({
    this.none = const [],
    this.elevation1 = const [
      BoxShadow(offset: Offset(0, 1), blurRadius: 3, color: _shadowColor06),
      BoxShadow(offset: Offset(0, 1), blurRadius: 2, color: _shadowColor04),
    ],
    this.elevation2 = const [
      BoxShadow(offset: Offset(0, 4), blurRadius: 12, color: _shadowColor08),
      BoxShadow(offset: Offset(0, 2), blurRadius: 4, color: _shadowColor04),
    ],
    this.elevation3 = const [
      BoxShadow(
        offset: Offset(0, 8),
        blurRadius: 24,
        color: _shadowColorPrimary30,
      ),
    ],
    this.modal = const [
      BoxShadow(
        offset: Offset(0, 20),
        blurRadius: 60,
        color: _shadowColorModal,
      ),
    ],
  });

  @override
  CustomShadows copyWith({
    List<BoxShadow>? none,
    List<BoxShadow>? elevation1,
    List<BoxShadow>? elevation2,
    List<BoxShadow>? elevation3,
    List<BoxShadow>? modal,
  }) {
    return CustomShadows(
      none: none ?? this.none,
      elevation1: elevation1 ?? this.elevation1,
      elevation2: elevation2 ?? this.elevation2,
      elevation3: elevation3 ?? this.elevation3,
      modal: modal ?? this.modal,
    );
  }

  @override
  CustomShadows lerp(ThemeExtension<CustomShadows>? other, double t) {
    if (other is! CustomShadows) return this;
    return CustomShadows(
      none: BoxShadow.lerpList(none, other.none, t) ?? none,
      elevation1:
          BoxShadow.lerpList(elevation1, other.elevation1, t) ?? elevation1,
      elevation2:
          BoxShadow.lerpList(elevation2, other.elevation2, t) ?? elevation2,
      elevation3:
          BoxShadow.lerpList(elevation3, other.elevation3, t) ?? elevation3,
      modal: BoxShadow.lerpList(modal, other.modal, t) ?? modal,
    );
  }
}
