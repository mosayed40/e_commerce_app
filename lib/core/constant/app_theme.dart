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
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.grey[600],
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.grey[600],
    ),
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
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
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.grey[600],
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.grey[600],
    ),
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);
