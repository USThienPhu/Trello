import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_colors.dart';
import 'package:mobile/core/constants/app_value.dart';
import 'package:mobile/core/constants/app_string.dart';
import 'package:flutter/gestures.dart';
import 'package:mobile/core/theme/device_value.dart';

class AuthFooterLinks extends StatelessWidget {
  final VoidCallback? onNotification;
  final VoidCallback? onPrivacyPolicy;
  final VoidCallback? onContactSupport;

  const AuthFooterLinks({
    super.key,
    this.onNotification,
    this.onPrivacyPolicy,
    this.onContactSupport,
  });

  @override
  Widget build(BuildContext context) {
    final textSize = DeviceValue.get(AppSize.s12);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text.rich(
          TextSpan(
            text: AppString.termOfServiceText,
            style: TextStyle(
              color: AppColors.white,
              fontSize: textSize,
            ),
            children: [
              TextSpan(
                text: AppString.termsOfService,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
                recognizer: TapGestureRecognizer()..onTap = onNotification != null ? () => onNotification!() : null,
              ),
              const TextSpan(text: " and "),
              TextSpan(
                text: AppString.privacyPolicy,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
                recognizer: TapGestureRecognizer()..onTap = onPrivacyPolicy != null ? () => onPrivacyPolicy!() : null,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: DeviceValue.get(AppSize.s12)),
        Text.rich(
          TextSpan(
                text: AppString.contactSupport,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: textSize,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  ),
                recognizer: TapGestureRecognizer()..onTap = onContactSupport != null ? () => onContactSupport!() : null,
          ),
          textAlign: TextAlign.center,
          ),
      ],        
    );
  }

}

