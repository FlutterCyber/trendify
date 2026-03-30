import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trendify/core/constants/app_strings.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../auth/screens/sign_in_screen.dart';
import '../../auth/screens/sign_up_screen.dart';
import '../../auth/widgets/social_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 2),

              Image.asset(AppConstants.logoGreen, width: 80, height: 80),

              const SizedBox(height: 32),

              Text(
                AppStrings.welcomeTitle.tr(),
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                AppStrings.welcomeSubtitle.tr(),
                style: const TextStyle(fontSize: 14, color: Color(0xFF888888)),
              ),

              const Spacer(),

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
              const SizedBox(height: 12),
              SocialButton(
                icon: 'assets/icons/facebook.png',
                label: AppStrings.welcomeContinueWithFacebook.tr(),
                onTap: () {},
              ),
              const SizedBox(height: 12),
              SocialButton(
                icon: 'assets/icons/twitter.png',
                label: AppStrings.welcomeContinueWithTwitter.tr(),
                onTap: () {},
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()),
                  ),
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

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignInScreen()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5F5F5),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    AppStrings.welcomeSignIn.tr(),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      AppStrings.welcomePrivacyPolicy.tr(),
                      style: const TextStyle(fontSize: 13, color: Color(0xFF888888)),
                    ),
                  ),
                  const Text('  ·  ', style: TextStyle(fontSize: 13, color: Color(0xFF888888))),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      AppStrings.welcomeTermsOfService.tr(),
                      style: const TextStyle(fontSize: 13, color: Color(0xFF888888)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
