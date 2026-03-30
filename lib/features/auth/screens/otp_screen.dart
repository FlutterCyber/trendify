import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trendify/core/constants/app_strings.dart';
import 'package:pinput/pinput.dart';
import '../../../core/theme/app_colors.dart';
import 'create_new_password_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _secondsLeft = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        timer.cancel();
      }
    });
  }

  void _onResend() {
    setState(() => _secondsLeft = 60);
    _timer?.cancel();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: 64,
      height: 64,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1A1A1A),
      ),
      decoration: BoxDecoration(
        color: AppColors.greyBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
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
                    AppStrings.otpTitle.tr(),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('🔒', style: TextStyle(fontSize: 24)),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                AppStrings.otpSubtitle.tr(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF888888),
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 32),

              Center(
                child: Pinput(
                  length: 4,
                  defaultPinTheme: defaultTheme,
                  focusedPinTheme: defaultTheme.copyWith(
                    decoration: defaultTheme.decoration!.copyWith(
                      border: Border.all(color: AppColors.primary, width: 1.5),
                    ),
                  ),
                  onCompleted: (_) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CreateNewPasswordScreen(),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, color: Color(0xFF888888)),
                    children: [
                      TextSpan(text: '${AppStrings.otpResendCodeIn.tr()} '),
                      TextSpan(
                        text: '$_secondsLeft',
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text: ' ${AppStrings.otpSeconds.tr()}'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Center(
                child: GestureDetector(
                  onTap: _secondsLeft == 0 ? _onResend : null,
                  child: Text(
                    AppStrings.otpResendCode.tr(),
                    style: TextStyle(
                      fontSize: 14,
                      color: _secondsLeft == 0 ? AppColors.primary : const Color(0xFFCCCCCC),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
