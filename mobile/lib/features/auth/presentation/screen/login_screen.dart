import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(AppString.login),
      ),
    );
  }
}