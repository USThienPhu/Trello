import 'package:flutter/material.dart';

class AppElevation {
  AppElevation._();

  static List<BoxShadow> get card => const [
        BoxShadow(
          color: Color(0x1A000000),
          blurRadius: 4,
          offset: Offset(0, 1),
        ),
      ];

  static List<BoxShadow> get cardDragging => const [
        BoxShadow(
          color: Color(0x33000000),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get bottomSheet => const [
        BoxShadow(
          color: Color(0x29000000),
          blurRadius: 10,
          offset: Offset(0, -2),
        ),
      ];

  static List<BoxShadow> get modal => const [
        BoxShadow(
          color: Color(0x40000000),
          blurRadius: 16,
          offset: Offset(0, 8),
        ),
      ];
}