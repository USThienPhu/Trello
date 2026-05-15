import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_value.dart';
import 'package:mobile/core/theme/device_value.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final imageSize = DeviceValue.get(AppSize.s320);

    return Center(
      child: Image.asset(
        'assets/pictures/LandingPicture.png',
        width: imageSize,
        height: imageSize,
      ),
    );
  }
}