import 'package:flutter/material.dart';
import 'package:mobile/core/constants/app_string.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppString.register),
      ),
    );
  }
}