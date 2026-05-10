import 'package:flutter/material.dart';
import 'package:mobile/core/common_widgets/app_name.dart';
import 'package:mobile/core/constants/app_spacing.dart';
import 'package:mobile/core/constants/app_size.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/pictures/LandingPicture.png',
          width: AppSize.s120,
          height: AppSize.s120,
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}