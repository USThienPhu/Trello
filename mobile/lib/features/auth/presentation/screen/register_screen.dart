import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/constants/app_string.dart';
import 'package:mobile/core/constants/app_colors.dart';
import 'package:mobile/core/constants/app_spacing.dart';
import 'package:mobile/core/constants/app_value.dart';
import 'package:mobile/core/theme/device_value.dart';
import 'package:mobile/features/auth/presentation/widget/landing_logo.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = screenHeight * 0.08;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Back button
            Padding(
              padding: EdgeInsets.only(
                left: DeviceValue.get(AppSize.s8),
                top: DeviceValue.get(AppSize.s8),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.black,
                    size: DeviceValue.get(AppSize.s24),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: AppSpacing.lg,
                  right: AppSpacing.lg,
                  top: topPadding,
                  bottom: AppSpacing.xxl,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const LandingLogo(),
                      SizedBox(height: DeviceValue.get(AppSize.s48)),
                      Text(
                        AppString.createYourAccount,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: DeviceValue.get(AppSize.s24),
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: DeviceValue.get(AppSize.s8)),
                      Text(
                        AppString.signUpToGetStarted,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: DeviceValue.get(AppSize.s14),
                          color: AppColors.gray,
                        ),
                      ),
                      SizedBox(height: DeviceValue.get(AppSize.s32)),
                      _buildTextField(
                        controller: _nameController,
                        hintText: AppString.name,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: DeviceValue.get(AppSize.s16)),
                      _buildTextField(
                        controller: _emailController,
                        hintText: AppString.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: DeviceValue.get(AppSize.s16)),
                      _buildTextField(
                        controller: _passwordController,
                        hintText: AppString.password,
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.gray,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: DeviceValue.get(AppSize.s16)),
                      _buildTextField(
                        controller: _confirmPasswordController,
                        hintText: AppString.confirmPassword,
                        obscureText: _obscureConfirmPassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.gray,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: DeviceValue.get(AppSize.s32)),
                      _buildSignUpButton(),
                      SizedBox(height: DeviceValue.get(AppSize.s24)),
                      _buildLoginLink(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(
        fontSize: DeviceValue.get(AppSize.s16),
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: DeviceValue.get(AppSize.s16),
          color: AppColors.gray,
        ),
        filled: true,
        fillColor: AppColors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: DeviceValue.get(AppSize.s16),
          vertical: DeviceValue.get(AppSize.s16),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DeviceValue.get(AppSize.s8)),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DeviceValue.get(AppSize.s8)),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DeviceValue.get(AppSize.s8)),
          borderSide: BorderSide(color: AppColors.trelloBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DeviceValue.get(AppSize.s8)),
          borderSide: const BorderSide(color: Colors.red),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      height: DeviceValue.get(AppSize.s48),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // TODO: Implement registration
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.trelloBlue,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DeviceValue.get(AppSize.s8)),
          ),
        ),
        child: Text(
          AppString.signUp,
          style: TextStyle(
            fontSize: DeviceValue.get(AppSize.s16),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppString.alreadyHaveAccount,
          style: TextStyle(
            fontSize: DeviceValue.get(AppSize.s14),
            color: AppColors.gray,
          ),
        ),
        TextButton(
          onPressed: () => context.push('/login'),
          child: Text(
            AppString.logIn,
            style: TextStyle(
              fontSize: DeviceValue.get(AppSize.s14),
              color: AppColors.trelloBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}