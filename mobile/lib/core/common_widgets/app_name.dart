import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_colors.dart';
import 'package:mobile/core/constants/app_value.dart';

class AppName extends StatelessWidget {
  final double fontSize;

  const AppName({
    super.key,
    this.fontSize = AppSize.s48,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      _appName,
      style: TextStyle(
        fontFamily: 'SanSerif',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        letterSpacing: -1,
      ),
    );
  }

  static const String _appName = 'Trello';
}