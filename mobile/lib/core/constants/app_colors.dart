import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Trello Blue (brand)
  static const Color trelloBlue = Color(0xFF0052CC);
  static const Color trelloBlueLight = Color(0xFF4C9AFF);
  static const Color trelloBlueDark = Color(0xFF0747A6);

  // Background colors for boards (solid)
  static const Color boardGreen = Color(0xFF026AA7);
  static const Color boardBlue = Color(0xFF0984E3);
  static const Color boardPurple = Color(0xFF6654C2);
  static const Color boardPink = Color(0xFFE5493A);
  static const Color boardRed = Color(0xFFEB5A46);
  static const Color boardOrange = Color(0xFFFF9F1A);
  static const Color boardYellow = Color(0xFFF2D600);
  static const Color boardSky = Color(0xFF00C2E0);
  static const Color boardLime = Color(0xFF51E898);
  static const Color boardBlack = Color(0xFF344563);

  // Label colors for cards
  static const Color labelGreen = Color(0xFF61BD4F);
  static const Color labelYellow = Color(0xFFF2D600);
  static const Color labelOrange = Color(0xFFFF9F1A);
  static const Color labelRed = Color(0xFFEB5A46);
  static const Color labelPurple = Color(0xFFC377E0);
  static const Color labelBlue = Color(0xFF0079BF);
  static const Color labelPink = Color(0xFFFF78AD);
  static const Color labelSky = Color(0xFF00C2E0);
  static const Color labelLime = Color(0xFF51E898);
  static const Color labelBlack = Color(0xFF344563);

  // UI colors
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color cardHover = Color(0xFFF4F5F7);
  static const Color background = Color(0xFF0079BF); // Default board bg
  static const Color darkOverlay = Color(0x66000000); // 40% black for images
  static const Color divider = Color(0xFFDFE1E6);
  static const Color textPrimary = Color(0xFF172B4D);
  static const Color textSecondary = Color(0xFF5E6C84);
  static const Color textLight = Color(0xFFFFFFFF);

  // Interactive states
  static const Color hover = Color(0xFF091E4214);
  static const Color pressed = Color(0xFF091E4229);
  static const Color focus = Color(0xFF2684FF);

  // Pre-defined lists
  static const List<Color> boardBackgrounds = [
    boardGreen,
    boardBlue,
    boardPurple,
    boardPink,
    boardRed,
    boardOrange,
    boardYellow,
    boardSky,
    boardLime,
    boardBlack,
  ];

  static const List<Color> labelColors = [
    labelGreen,
    labelYellow,
    labelOrange,
    labelRed,
    labelPurple,
    labelBlue,
    labelPink,
    labelSky,
    labelLime,
    labelBlack,
  ];
}