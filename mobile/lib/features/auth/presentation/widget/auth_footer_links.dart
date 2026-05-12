import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_colors.dart';
import 'package:mobile/core/constants/app_value.dart';
import 'package:mobile/core/constants/app_string.dart';
import 'package:flutter/gestures.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text.rich(
          TextSpan(
            text: AppString.termOfServiceText,
            style: TextStyle(
              color: AppColors.white.withOpacity(0.7),
              fontSize: AppSize.s10,
            ),
            children: [
              TextSpan(
                text: AppString.termsOfService,
                style: TextStyle(decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()..onTap = () => onNotification,
                children: [
                  TextSpan(
                    text: " and ",
                    style: TextStyle(decoration: TextDecoration.none),
                  ),
                  TextSpan(
                    text: AppString.privacyPolicy,
                    style: TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = () => onPrivacyPolicy,
                  ),
                ],
              )
            ],
          ),
          textAlign: TextAlign.center,
        ),



        // _LinkText(
        //   // message: "By signing up, you agree to our ",
        //   message: AppString.termOfServiceText,
        //   clickAblMessage: AppString.termsOfService,
        //   onTap: onNotification,
        // ),
        // _LinkText(
        //   message: "Privacy Policy",
        //   clickAblMessage: AppString.privacyPolicy,
        //   onTap: onPrivacyPolicy,
        // ),
        _LinkText(  
          message: "Contact Support",
          clickAblMessage: AppString.contactSupport,
          onTap: onContactSupport,
        ),
      ],
    );
  }

}

class _LinkText extends StatelessWidget {
  final String? message;
  final String clickAblMessage;
  final VoidCallback? onTap;

  const _LinkText({
    required this.clickAblMessage ,
    this.message,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: message,
        children: [
          TextSpan(
            text: clickAblMessage,
            style: TextStyle(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = () => onTap,
          )
        ],
        style: TextStyle(
          color: AppColors.white.withOpacity(0.7),
          fontSize: AppSize.s10,
          decoration: TextDecoration.underline,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}