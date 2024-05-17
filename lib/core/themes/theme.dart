import 'package:expancetracker/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Palette.primary,
      secondary: Palette.secondary,
      tertiary: Palette.tertiary,
      surface: Palette.background,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: Palette.background,
    useMaterial3: true,
    fontFamily: 'Poppins',
  );
}
