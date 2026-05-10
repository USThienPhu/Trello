import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_colors.dart';

class AppTypography {
  AppTypography._();

  static TextStyle get boardTitle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        letterSpacing: -0.5,
      );

  static TextStyle get boardTitleSmall => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        letterSpacing: -0.5,
      );

  static TextStyle get listHeader => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get cardTitle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get cardSubtitle => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  static TextStyle get memberInitials => const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      );

  static TextStyle get button => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get input => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      );
}