import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trendify/core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import 'welcome_screen.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_PageData> _pages = const [
    _PageData(
      image: 'assets/images/walkthrough_1.png',
      title: 'Explore Fashion Trends\nwith Trendify',
      description:
          'Dive into the world of fashion with Trendify, where you can discover the latest and hottest styles curated just for you.',
    ),
    _PageData(
      image: 'assets/images/walkthrough_2.png',
      title: 'Your Style, Your Trendify\nExperience',
      description:
          "Trendify goes beyond fashion – it's a personalized style journey. Start your fashion adventure with Trendify today.",
    ),
    _PageData(
      image: 'assets/images/walkthrough_3.png',
      title: 'Seamless Fashion,\nSeamless Shopping',
      description:
          'Trendify offers an effortless shopping experience, making your style journey smoother than ever.',
    ),
  ];

  void _goToWelcome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
    );
  }

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _goToWelcome();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top: Image
          Expanded(
            flex: 6,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (i) => setState(() => _currentPage = i),
              itemCount: _pages.length,
              itemBuilder:
                  (_, index) => Image.asset(
                    _pages[index].image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
            ),
          ),

          // Bottom: Text + Indicator + Buttons
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 28),

                  Text(
                    _pages[_currentPage].title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h2,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    _pages[_currentPage].description,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyMedium,
                  ),

                  const SizedBox(height: 20),

                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _pages.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: Color(0xFFDDDDDD),
                      dotHeight: 7,
                      dotWidth: 7,
                      expansionFactor: 3,
                    ),
                  ),

                  const Spacer(),

                  _currentPage == _pages.length - 1
                      ? _buildLastButton()
                      : _buildNavButtons(),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: _goToWelcome,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Color(0xFFDDDDDD)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text(
              'Skip',
              style: TextStyle(color: Color(0xFF555555), fontSize: 15),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: _onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _goToWelcome,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 18),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: const Text(
          "Let's Get Started",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class _PageData {
  final String image;
  final String title;
  final String description;

  const _PageData({
    required this.image,
    required this.title,
    required this.description,
  });
}
