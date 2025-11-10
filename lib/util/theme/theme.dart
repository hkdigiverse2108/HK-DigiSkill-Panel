import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hkdigiskill_admin/util/constants/colors.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';

class AdminTheme {
  static final ThemeData adminLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AdminColors.primary,
    colorScheme: ColorScheme.light(
      primary: AdminColors.primary,
      secondary: AdminColors.secondary,
      error: AdminColors.error,
      background: AdminColors.primaryBackground,
      surface: AdminColors.white,
    ),
    scaffoldBackgroundColor: AdminColors.primaryBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AdminColors.white,
      foregroundColor: AdminColors.textWhite,
      elevation: 0,
      iconTheme: IconThemeData(color: AdminColors.iconPrimary),
      titleTextStyle: GoogleFonts.poppins(
        color: AdminColors.textWhite,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    iconTheme: IconThemeData(color: AdminColors.iconPrimary),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 57,
      ),
      displayMedium: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 45,
      ),
      displaySmall: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headlineLarge: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      titleLarge: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
      titleMedium: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      titleSmall: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: AdminColors.textSecondary,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: AdminColors.textSecondary,
        fontSize: 14,
      ),
      bodySmall: GoogleFonts.poppins(
        color: AdminColors.textSecondary,
        fontSize: 12,
      ),
      labelLarge: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      labelMedium: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontSize: 12,
      ),
      labelSmall: GoogleFonts.poppins(
        color: AdminColors.textPrimary,
        fontSize: 11,
      ),
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: AdminColors.buttonPrimary,
      disabledColor: AdminColors.buttonDisabled,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(AdminSizes.buttonElevation),
        backgroundColor: WidgetStatePropertyAll(AdminColors.buttonPrimary),
        foregroundColor: WidgetStatePropertyAll(AdminColors.textWhite),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AdminSizes.buttonRadius),
          ),
        ),
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size.fromHeight(AdminSizes.buttonHeight),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AdminColors.borderPrimary),
        borderRadius: BorderRadius.circular(AdminSizes.inputFieldRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AdminColors.primary),
        borderRadius: BorderRadius.circular(AdminSizes.inputFieldRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AdminColors.borderPrimary),
        borderRadius: BorderRadius.circular(AdminSizes.inputFieldRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AdminColors.error),
        borderRadius: BorderRadius.circular(AdminSizes.inputFieldRadius),
      ),
      hintStyle: TextStyle(color: AdminColors.grey),
      labelStyle: TextStyle(color: AdminColors.darkGrey),
      fillColor: AdminColors.white,
      filled: true,
    ),
    cardColor: AdminColors.white,
    dividerColor: AdminColors.grey,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AdminColors.darkerGrey,
      contentTextStyle: TextStyle(color: AdminColors.textWhite),
      actionTextColor: AdminColors.accent,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(AdminColors.primary),
      // overlayColor: WidgetStatePropertyAll(AdminColors.primary),
      // splashRadius: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AdminSizes.borderRadiusSm),
      ),
    ),
  );

  static final ThemeData adminDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AdminColors.primary,
    colorScheme: ColorScheme.dark(
      primary: AdminColors.primary,
      secondary: AdminColors.secondary,
      error: AdminColors.error,
      background: AdminColors.dark,
      surface: AdminColors.darkContainer,
    ),
    scaffoldBackgroundColor: AdminColors.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: AdminColors.black,
      foregroundColor: AdminColors.textWhite,
      elevation: 0,
      iconTheme: IconThemeData(color: AdminColors.accent),
      titleTextStyle: GoogleFonts.poppins(
        color: AdminColors.textWhite,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    iconTheme: IconThemeData(color: AdminColors.accent),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        color: AdminColors.textWhite,
        fontWeight: FontWeight.bold,
        fontSize: 57,
      ),
      displayMedium: GoogleFonts.poppins(
        color: AdminColors.textWhite,
        fontWeight: FontWeight.bold,
        fontSize: 45,
      ),
      displaySmall: GoogleFonts.poppins(
        color: AdminColors.textWhite,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headlineLarge: GoogleFonts.poppins(
        color: AdminColors.textWhite,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: AdminColors.textWhite,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: AdminColors.textWhite,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      titleLarge: GoogleFonts.poppins(
        color: AdminColors.accent,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      titleMedium: GoogleFonts.poppins(
        color: AdminColors.accent,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      titleSmall: GoogleFonts.poppins(
        color: AdminColors.accent,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: AdminColors.lightGrey,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: AdminColors.softGrey,
        fontSize: 14,
      ),
      bodySmall: GoogleFonts.poppins(color: AdminColors.grey, fontSize: 12),
      labelLarge: GoogleFonts.poppins(
        color: AdminColors.darkGrey,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      labelMedium: GoogleFonts.poppins(
        color: AdminColors.darkGrey,
        fontSize: 12,
      ),
      labelSmall: GoogleFonts.poppins(
        color: AdminColors.darkGrey,
        fontSize: 11,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AdminColors.primary,
      disabledColor: AdminColors.buttonDisabled,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(AdminSizes.buttonElevation),
        backgroundColor: WidgetStatePropertyAll(AdminColors.buttonPrimary),
        foregroundColor: WidgetStatePropertyAll(AdminColors.textWhite),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AdminSizes.buttonRadius),
          ),
        ),
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AdminColors.borderSecondary),
        borderRadius: BorderRadius.circular(AdminSizes.inputFieldRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AdminColors.primary),
        borderRadius: BorderRadius.circular(AdminSizes.inputFieldRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AdminColors.borderSecondary),
        borderRadius: BorderRadius.circular(AdminSizes.inputFieldRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AdminColors.error),
        borderRadius: BorderRadius.circular(AdminSizes.inputFieldRadius),
      ),
      hintStyle: TextStyle(color: AdminColors.softGrey),
      labelStyle: TextStyle(color: AdminColors.lightGrey),
      fillColor: AdminColors.darkContainer,
      filled: true,
    ),
    cardColor: AdminColors.darkContainer,
    dividerColor: AdminColors.darkerGrey,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AdminColors.darkGrey,
      contentTextStyle: TextStyle(color: AdminColors.textWhite),
      actionTextColor: AdminColors.accent,
    ),
  );
}
