import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/constant/colors.dart';

// Language-specific theme for English

ThemeData themeEnglish = ThemeData(
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.textColor,
      fontSize: 24,
    ),
    bodyMedium: TextStyle(
      height: 2,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.grey[600],
    ),
  ),
);

// Language-specific theme for Arabic

ThemeData themeArabic = ThemeData(
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.textColor,
      fontSize: 24,
    ),
    bodyMedium: TextStyle(
      height: 2,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.grey[600],
    ),
  ),
);
