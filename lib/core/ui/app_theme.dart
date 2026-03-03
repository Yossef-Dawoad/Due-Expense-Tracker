import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expancetracker/core/ui/constants/border_radius.dart';
import 'package:expancetracker/core/ui/constants/breakpoints.dart';
import 'package:expancetracker/core/ui/constants/durations.dart';
import 'package:expancetracker/core/ui/constants/kit_colors.dart';
import 'package:expancetracker/core/ui/constants/shadows.dart';
import 'package:expancetracker/core/ui/constants/spacing.dart';
import 'package:expancetracker/core/ui/constants/text_styles.dart';

/// AppTheme is a class that builds a theme for the app.
/// Based directly on the design tokens (light mode optimized).
class AppTheme {
  static ThemeData buildTheme(Brightness brightness) {
    // Current design tokens are primarily light-mode based. We map them directly.
    final textStyles = const CustomTextStyles();
    final borderRadius = const CustomBorderRadius();
    final breakpoints = CustomBreakpoints();
    final shadows = const CustomShadows();
    final kitColors = const KitColorsExtension();
    final spacing = CustomSpacing.instance;

    return ThemeData(
      colorScheme: brightness == Brightness.light
          ? ColorScheme.light(
              surface: kitColors.bgBase,
              primary: kitColors.brandPrimary,
              onPrimary: kitColors.textOnPrimary,
              secondary: kitColors.bgSurfaceSecondary,
              onSecondary: kitColors.textPrimary,
              error: kitColors.semanticNegative,
              onError: kitColors.bgSurface,
              onSurface: kitColors.textPrimary,
              surfaceTint:
                  Colors.transparent, // Disable default MD3 surface tinting
            )
          : ColorScheme.dark(
              surface: kitColors.bgBase,
              primary: kitColors.brandPrimary,
              onPrimary: kitColors.textOnPrimary,
              secondary: kitColors.bgSurfaceSecondary,
              onSecondary: kitColors.textPrimary,
              error: kitColors.semanticNegative,
              onError: kitColors.bgSurface,
              onSurface: kitColors.textPrimary,
              surfaceTint: Colors.transparent,
            ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
        },
      ),
      scaffoldBackgroundColor: kitColors.bgBase,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: kitColors.textPrimary,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: kitColors.borderDefault,
        thickness: 1,
      ),
      textTheme: TextTheme(
        bodyLarge: textStyles.bodyMD.copyWith(color: kitColors.textPrimary),
        bodyMedium: textStyles.bodySM.copyWith(color: kitColors.textSecondary),
        titleMedium: textStyles.headingMD.copyWith(
          color: kitColors.textPrimary,
        ),
        headlineLarge: textStyles.displayMD.copyWith(
          color: kitColors.textPrimary,
        ),
      ),
      iconTheme: IconThemeData(color: kitColors.textSecondary),
      extensions: [textStyles, borderRadius, breakpoints, shadows, kitColors],
      useMaterial3: true,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,

      // COMPONENTS MAPPING
      cardTheme: CardThemeData(
        color: kitColors.bgSurface,
        elevation:
            0, // Enforce custom shadows via Container instead of default Material shadows
        shape: RoundedRectangleBorder(borderRadius: borderRadius.card),
        margin: EdgeInsets.zero,
      ),

      chipTheme: ChipThemeData(
        backgroundColor: kitColors.bgSurface,
        disabledColor: kitColors.bgSurfaceSecondary,
        selectedColor: kitColors.bgSurface,
        secondarySelectedColor: kitColors.bgSurface,
        padding: EdgeInsets.symmetric(
          horizontal: spacing.s3,
          vertical: spacing.s2,
        ),
        labelStyle: textStyles.bodySM.copyWith(color: kitColors.textPrimary),
        secondaryLabelStyle: textStyles.bodySM.copyWith(
          color: kitColors.brandPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius.chip,
          side: BorderSide(color: kitColors.borderDefault, width: 1),
        ),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: kitColors.brandPrimary,
        linearTrackColor: kitColors.bgSurfaceSecondary,
        circularTrackColor: kitColors.bgSurfaceSecondary,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return kitColors.brandPrimary;
          }
          return kitColors.textPlaceholder;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return kitColors.brandPrimary.withValues(
              alpha: 0.2,
            ); // Token active bg approx
          }
          return kitColors.bgSurfaceSecondary; // #F3F4F6
        }),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: kitColors.bgSurface,
        selectedItemColor: kitColors.brandPrimary,
        unselectedItemColor: kitColors.textPlaceholder,
        selectedLabelStyle: textStyles.tabLabel.copyWith(
          color: kitColors.brandPrimary,
        ),
        unselectedLabelStyle: textStyles.tabLabel.copyWith(
          color: kitColors.textPlaceholder,
        ),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),

      badgeTheme: BadgeThemeData(
        backgroundColor: kitColors.semanticPositive.withValues(
          alpha: 0.15,
        ), // Matches #DCFCE7 visually roughly
        textColor: kitColors.semanticPositive, // #16A34A
        textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kitColors.brandPrimary,
        foregroundColor: kitColors.textOnPrimary,
        elevation: 0, // Suggest using custom shadows wrapper or 0
        shape: RoundedRectangleBorder(borderRadius: borderRadius.fab),
        iconSize: 24,
      ),

      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(color: kitColors.textPrimary),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(kitColors.bgSurface),
          surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: kitColors.bgSurfaceSecondary,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kitColors.borderDefault),
            borderRadius: borderRadius.input,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kitColors.borderDefault),
            borderRadius: borderRadius.input,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kitColors.borderFocus),
            borderRadius: borderRadius.input,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: spacing.cardPadding,
            vertical: spacing.inputVerticalPadding,
          ),
          hintStyle: textStyles.bodyMD.copyWith(
            color: kitColors.textPlaceholder,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: kitColors.bgSurface, // Tokens map specific inputs to #FFFFFF
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kitColors.borderDefault),
          borderRadius: borderRadius.input,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kitColors.borderDefault),
          borderRadius: borderRadius.input,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kitColors.borderFocus, width: 2),
          borderRadius: borderRadius.input,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.s4, // 16px
          vertical: spacing.inputVerticalPadding, // 14px
        ),
        hintStyle: textStyles.bodyMD.copyWith(color: kitColors.textPlaceholder),
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: kitColors.bgSurface,
        textStyle: textStyles.bodyMD.copyWith(color: kitColors.textPrimary),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kitColors.brandPrimary,
          foregroundColor: kitColors.textOnPrimary,
          textStyle: textStyles.cta,
          shape: RoundedRectangleBorder(borderRadius: borderRadius.button),
          elevation: 0,
          minimumSize: const Size.fromHeight(56), // Token height: 56px
          padding: EdgeInsets.symmetric(
            horizontal: spacing.cardPaddingLG,
            vertical: spacing.s4,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: kitColors.textPrimary,
          shape: RoundedRectangleBorder(borderRadius: borderRadius.button),
          side: BorderSide(color: kitColors.borderDefault),
          minimumSize: const Size(64, 56), // 56px height consistency
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: kitColors.textLink,
          textStyle: textStyles.cta,
          shape: RoundedRectangleBorder(borderRadius: borderRadius.button),
          minimumSize: const Size(64, 56), // Optional height consistency
        ),
      ),
    );
  }
}

extension ThemeDataX on BuildContext {
  ThemeData get theme => Theme.of(this);

  CustomTextStyles get textStyles =>
      Theme.of(this).extension<CustomTextStyles>()!;

  KitColorsExtension get kitColors =>
      Theme.of(this).extension<KitColorsExtension>()!;

  CustomBorderRadius get borderRadius =>
      Theme.of(this).extension<CustomBorderRadius>()!;

  CustomBreakpoints get breakpoints =>
      Theme.of(this).extension<CustomBreakpoints>()!;

  CustomDurations get durations => CustomDurations.instance;

  CustomSpacing get spacing => CustomSpacing.instance;

  CustomShadows get shadows => Theme.of(this).extension<CustomShadows>()!;
}
