import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trendify/core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/auth_input_field.dart';
import '../widgets/loading_overlay.dart';
import '../widgets/social_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _agreeToTerms = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUp() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, size: 24),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Text(
                        AppStrings.signUpTitle.tr(),
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.person, size: 28, color: Colors.blueGrey.shade300),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.signUpSubtitle.tr(),
                    style: const TextStyle(fontSize: 14, color: Color(0xFF888888)),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    AppStrings.signUpEmail.tr(),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  AuthInputField(
                    controller: _emailController,
                    hint: AppStrings.signUpEmailHint.tr(),
                    prefixIcon: Icons.mail_outline_rounded,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppStrings.signUpPassword.tr(),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  AuthInputField(
                    controller: _passwordController,
                    hint: AppStrings.signUpPasswordHint.tr(),
                    prefixIcon: Icons.lock_outline_rounded,
                    obscureText: _obscurePassword,
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() => _obscurePassword = !_obscurePassword),
                      child: Icon(
                        _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => _agreeToTerms = !_agreeToTerms),
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: _agreeToTerms ? AppColors.primary : Colors.transparent,
                            border: Border.all(
                              color: _agreeToTerms ? AppColors.primary : const Color(0xFFCCCCCC),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: _agreeToTerms
                              ? const Icon(Icons.check, color: Colors.white, size: 14)
                              : null,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        AppStrings.signUpAgreeToTerms.tr(),
                        style: const TextStyle(fontSize: 14, color: Color(0xFF1A1A1A)),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          AppStrings.signUpTermsAndConditions.tr(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppStrings.signUpAlreadyHaveAccount.tr(),
                          style: const TextStyle(fontSize: 14, color: Color(0xFF888888)),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            AppStrings.welcomeSignIn.tr(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Color(0xFFEEEEEE))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('or', style: TextStyle(color: Color(0xFF888888))),
                      ),
                      Expanded(child: Divider(color: Color(0xFFEEEEEE))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SocialButton(
                    icon: 'assets/icons/google.png',
                    label: AppStrings.welcomeContinueWithGoogle.tr(),
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  SocialButton(
                    icon: 'assets/icons/apple.png',
                    label: AppStrings.welcomeContinueWithApple.tr(),
                    onTap: () {},
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onSignUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        AppStrings.welcomeSignUp.tr(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          if (_isLoading) LoadingOverlay(message: AppStrings.signUpLoading.tr()),
        ],
      ),
    );
  }
}
