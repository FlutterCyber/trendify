class AppConstants {
  AppConstants._();

  // App info
  static const String appName = 'Trendify';

  // Assets
  static const String logoWhite = 'assets/images/logo.png';
  static const String logoGreen = 'assets/images/logo_green.png';

  // Splash
  static const int splashDurationMs = 3000;

  // Walkthrough
  static const List<WalkthroughItem> walkthroughItems = [
    WalkthroughItem(
      image: 'assets/images/walkthrough_1.png',
      title: 'Explore Fashion Trends\nwith Trendify',
      description:
      'Dive into the world of fashion with Trendify, where you can discover the latest and hottest styles curated just for you.',
    ),
    WalkthroughItem(
      image: 'assets/images/walkthrough_2.png',
      title: 'Your Style, Your Trendify\nExperience',
      description:
      "Trendify goes beyond fashion – it's a personalized style journey. Start your fashion adventure with Trendify today.",
    ),
    WalkthroughItem(
      image: 'assets/images/walkthrough_3.png',
      title: 'Seamless Fashion,\nSeamless Shopping',
      description:
      'Trendify offers an effortless shopping experience, making your style journey smoother than ever.',
    ),
  ];

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

  // Sign up screen
  static const String signUpTitle = 'Join Trendify Today';
  static const String signUpSubtitle = 'Embark on a fashion journey tailored for you.';
  static const String email = 'Email';
  static const String emailHint = 'Email';
  static const String password = 'Password';
  static const String passwordHint = 'Password';
  static const String agreeToTerms = 'I agree to Trendify ';
  static const String termsAndConditions = 'Terms & Conditions.';
  static const String alreadyHaveAccount = 'Already have an account? ';
  static const String signUpLoading = 'Sign up...';

  // Sign in screen
  static const String signInTitle = 'Welcome Back!';
  static const String signInSubtitle = 'Sign in to access your personalized fashion.';
  static const String rememberMe = 'Remember me';
  static const String forgotPassword = 'Forgot Password?';
  static const String dontHaveAccount = "Don't have an account? ";
  static const String signInLoading = 'Sign in...';

  // Forgot password screen
  static const String forgotPasswordTitle = 'Forgot Your Password?';
  static const String forgotPasswordSubtitle =
      "We've got you covered. Enter your registered email to reset your password. We will send an OTP code to your email for the next steps.";
  static const String registeredEmail = 'Your Registered Email';
  static const String sendOtpCode = 'Send OTP Code';

  // OTP screen
  static const String otpTitle = 'Enter OTP Code';
  static const String otpSubtitle =
      'Please check your email inbox for a message from Trendify. Enter the one-time verification code below.';
  static const String resendCode = 'Resend code';
  static const String resendCodeIn = 'You can resend the code in';
  static const String seconds = 'seconds';

  // Create new password screen
  static const String createPasswordTitle = 'Secure Your Account';
  static const String createPasswordSubtitle =
      'Almost there! Create a new password for your Trendify account to keep it secure. Remember to choose a strong and unique password.';
  static const String newPassword = 'New Password';
  static const String newPasswordHint = 'New Password';
  static const String confirmNewPassword = 'Confirm New Password';
  static const String confirmNewPasswordHint = 'Confirm New Password';
  static const String saveNewPassword = 'Save New Password';

  // Reset success screen
  static const String resetSuccessTitle = "You're All Set!";
  static const String resetSuccessSubtitle = 'Your password has been successfully changed.';
  static const String goToHomepage = 'Go to Homepage';

  // Home screen
  static const List<String> homeCategories = ['Discover', 'Women', 'Men', 'Shoe', 'Bag'];

  static const List<ProductItem> featuredProducts = [
    ProductItem(image: 'assets/images/image_1.png', name: 'Urban Blend Long Sleeve', price: 185.00, rating: 4.8),
    ProductItem(image: 'assets/images/image_1.png', name: 'Luxe Blend Formal Shirt', price: 160.00, rating: 4.6),
    ProductItem(image: 'assets/images/image_1.png', name: 'Urban Flex Casual', price: 175.00, rating: 4.7),
  ];

  static const List<ProductItem> newArrivalProducts = [
    ProductItem(image: 'assets/images/image_1.png', name: 'Trend Craft Fleece', price: 210.00, rating: 4.9),
    ProductItem(image: 'assets/images/image_1.png', name: 'Moda Chic Luxury', price: 200.00, rating: 4.8),
    ProductItem(image: 'assets/images/image_1.png', name: 'Urban Elegance', price: 215.00, rating: 4.5),
  ];

  static const List<ProductItem> hotDealsProducts = [
    ProductItem(image: 'assets/images/image_1.png', name: 'Street Style Cozy Hoodie', price: 155.00, rating: 4.5),
    ProductItem(image: 'assets/images/image_1.png', name: 'Street Style Comfort', price: 155.00, rating: 4.7),
    ProductItem(image: 'assets/images/image_1.png', name: 'Vogue Fit Co.', price: 160.00, rating: 4.6),
  ];

  static const List<CategoryItem> categoryGridItems = [
    CategoryItem(label: 'Women', image: 'assets/images/image_2.png'),
    CategoryItem(label: 'Men', image: 'assets/images/image_2.png'),
    CategoryItem(label: 'Shoe', image: 'assets/images/image_2.png'),
    CategoryItem(label: 'Bag', image: 'assets/images/image_2.png'),
    CategoryItem(label: 'Luxury', image: 'assets/images/image_2.png'),
    CategoryItem(label: 'Kids', image: 'assets/images/image_2.png'),
    CategoryItem(label: 'Sports', image: 'assets/images/image_2.png'),
    CategoryItem(label: 'Beauty', image: 'assets/images/image_2.png'),
    CategoryItem(label: 'Lifestyle', image: 'assets/images/image_2.png'),
    CategoryItem(label: 'Other', image: 'assets/images/image_2.png'),
  ];
}

class WalkthroughItem {
  final String image;
  final String title;
  final String description;

  const WalkthroughItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

class ProductItem {
  final String image;
  final String name;
  final double price;
  final double rating;

  const ProductItem({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  });
}

class CategoryItem {
  final String label;
  final String image;

  const CategoryItem({
    required this.label,
    required this.image,
  });
}