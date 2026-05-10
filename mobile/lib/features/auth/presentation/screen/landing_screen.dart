import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_colors.dart';
import 'package:mobile/core/constants/app_spacing.dart';
import 'package:mobile/core/theme/device_value.dart';
import 'package:mobile/features/auth/presentation/widget/landing_logo.dart';
import 'package:mobile/features/auth/presentation/widget/landing_buttons.dart';

class LandingScreen extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onSignUp;

  const LandingScreen({
    super.key,
    required this.onLogin,
    required this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    final padding = DeviceValue.get(AppSpacing.lg);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.black,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              children: [
                const Spacer(flex: 2),
                const LandingLogo(),
                const Spacer(flex: 2),
                LandingButtons(
                  onLogin: onLogin,
                  onSignUp: onSignUp,
                ),
                SizedBox(height: DeviceValue.get(AppSpacing.xxl)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}