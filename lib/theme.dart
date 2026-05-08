import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromRGBO(162, 29, 19, 1);
  static const Color primaryAccent = Color.fromRGBO(120, 14, 14, 1);
  static const Color secondaryColor = Color.fromRGBO(45, 45, 45, 1);
  static const Color secondaryAccent = Color.fromRGBO(35, 35, 35, 1);
  static const Color titleColor = Color.fromRGBO(200, 200, 200, 1);
  static const Color textColor = Color.fromRGBO(150, 150, 150, 1);
  static const Color successColor = Color.fromRGBO(9, 149, 110, 1);
  static const Color highlightColor = Color.fromRGBO(212, 172, 13, 1);
}

ThemeData primaryTheme = ThemeData(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    primary: AppColors.primaryColor,
  ),

  //scaffold color
  scaffoldBackgroundColor: AppColors.secondaryAccent,

  //appbar theme colors
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  ),

  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
    bodyMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
  ),

  cardTheme: CardThemeData(
    color: AppColors.secondaryColor.withValues(alpha: 0.5),
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(),
    shadowColor: Colors.transparent,
    margin: const EdgeInsets.only(bottom: 16.0),
  ),

  // input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondaryColor.withValues(alpha: 0.5),
    border: InputBorder.none,
    labelStyle: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
    prefixIconColor: AppColors.textColor,
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.secondaryColor,
    surfaceTintColor: Colors.transparent,
  ),
);
