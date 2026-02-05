import 'package:expancetracker/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Palette.primary,
      secondary: Palette.accent,
      surface: Palette.white,
      onSurface: Palette.black, // Explicitly white as per design
    ),
    scaffoldBackgroundColor: Palette.background,
    useMaterial3: true,
    fontFamily: GoogleFonts.manrope().fontFamily,
    textTheme: GoogleFonts.manropeTextTheme(),
    extensions: [
      // If we needed custom theme extensions, they would go here.
      // For now, mapping accent to secondary covers most cases.
    ],
  );
}
