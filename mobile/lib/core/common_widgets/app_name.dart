import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_colors.dart';
import 'package:mobile/core/constants/app_size.dart';

class AppName extends StatelessWidget {
  final double fontSize;

  const AppName({
    super.key,
    this.fontSize = AppSize.s32,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      _appName,
      style: TextStyle(
        fontFamily: 'Charlie',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: AppColors.textLight,
        letterSpacing: -1,
      ),
    );
  }

  static const String _appName = 'Trello';
}