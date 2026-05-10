import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_value.dart';
import 'package:mobile/core/theme/device_value.dart';
import 'package:mobile/core/constants/app_string.dart';
import 'package:mobile/core/constants/app_colors.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final imageSize = DeviceValue.get(AppSize.s320);
    final fontSize = DeviceValue.get(AppSize.s20);

    return Column(
      children: [
        Image.asset(
          'assets/pictures/LandingPicture.png',
          width: imageSize,
          height: imageSize,
        ),
        SizedBox(height: AppSize.s48),
        Center(
          child: Text(
            AppString.landingText,
            textAlign: TextAlign.center,
            style: 
            TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: AppColors.gray,
              fontFamily: 'SanSerif',
            ),
          ),
        ),
      ],
    );
  }
}