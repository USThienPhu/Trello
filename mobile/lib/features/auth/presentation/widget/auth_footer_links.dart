import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_colors.dart';
import 'package:mobile/core/constants/app_value.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LinkText(
          label: 'Notification',
          onTap: onNotification,
        ),
        _divider,
        _LinkText(
          label: 'Privacy Policy',
          onTap: onPrivacyPolicy,
        ),
        _divider,
        _LinkText(
          label: 'Contact Support',
          onTap: onContactSupport,
        ),
      ],
    );
  }

  Widget get _divider => Container(
        width: 1,
        height: AppSize.s12,
        margin: const EdgeInsets.symmetric(horizontal: AppSize.spacingSm),
        color: AppColors.white.withValues(alpha: 0.3),
      );
}

class _LinkText extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _LinkText({
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: AppSize.s12,
          color: AppColors.white.withValues(alpha: 0.8),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}