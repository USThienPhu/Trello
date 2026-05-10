import 'package:flutter/material.dart';
import 'package:mobile/core/common_widgets/app_name.dart';
import 'package:mobile/core/constants/app_spacing.dart';
import 'package:mobile/core/constants/app_size.dart';
import 'package:mobile/core/theme/device_value.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final imageSize = DeviceValue.get(AppSize.s80);
    final fontSize = DeviceValue.get(AppSize.s24);

    return Column(
      children: [
        Image.asset(
          'assets/pictures/LandingPicture.png',
          width: imageSize,
          height: imageSize,
        ),
      ],
    );
  }
}