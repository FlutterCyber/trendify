import 'package:flutter/material.dart';
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

              // Logo
              Image.asset(AppConstants.logoGreen, width: 80, height: 80),

              const SizedBox(height: 32),

              // Title
              const Text(
                AppConstants.welcomeTitle,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),

              const SizedBox(height: 10),

              // Subtitle
              const Text(
                AppConstants.welcomeSubtitle,
                style: TextStyle(fontSize: 14, color: Color(0xFF888888)),
              ),

              const Spacer(),

              // Social buttons
              SocialButton(
                icon: 'assets/icons/google.png',
                label: AppConstants.continueWithGoogle,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              SocialButton(
                icon: 'assets/icons/apple.png',
                label: AppConstants.continueWithApple,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              SocialButton(
                icon: 'assets/icons/facebook.png',
                label: AppConstants.continueWithFacebook,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              SocialButton(
                icon: 'assets/icons/twitter.png',
                label: AppConstants.continueWithTwitter,
                onTap: () {},
              ),

              const Spacer(),

              // Sign up button
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
                  child: const Text(
                    AppConstants.signUp,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Sign in button
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
                  child: const Text(
                    AppConstants.signIn,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      AppConstants.privacyPolicy,
                      style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
                    ),
                  ),
                  const Text(
                    '  ·  ',
                    style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      AppConstants.termsOfService,
                      style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
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