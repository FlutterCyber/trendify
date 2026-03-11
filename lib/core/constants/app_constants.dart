class AppConstants {
  AppConstants._();

  // App info
  static const String appName = 'Trendify';

  // Splash
  static const int splashDurationMs = 3000;

  // Welcome screen
  static const String welcomeTitle = "Let's Get Started!";
  static const String welcomeSubtitle = "Let's dive in into your account";
  static const String signUp = 'Sign up';
  static const String signIn = 'Sign in';
  static const String privacyPolicy = 'Privacy Policy';
  static const String termsOfService = 'Terms of Service';

  static const String continueWithGoogle = 'Continue with Google';
  static const String continueWithApple = 'Continue with Apple';
  static const String continueWithFacebook = 'Continue with Facebook';
  static const String continueWithTwitter = 'Continue with Twitter';
}

class WalkthroughItem {
  final String title;
  final String description;

  const WalkthroughItem({required this.title, required this.description});
}
