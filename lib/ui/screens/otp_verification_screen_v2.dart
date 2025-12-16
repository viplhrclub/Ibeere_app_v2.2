import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_buttons.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_inputs.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_common.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({
    required this.phoneNumber,
    super.key,
  });

  final String phoneNumber;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  String _otp = '';
  int _resendTimer = 55;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimer > 0) {
        setState(() {
          _resendTimer--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _handleOTPComplete(String otp) {
    setState(() {
      _otp = otp;
    });
  }

  void _handleResendOTP() {
    if (_resendTimer == 0) {
      setState(() {
        _resendTimer = 55;
      });
      _startTimer();
    }
  }

  void _handleBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IbeereDecorativeBackground(
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 120),
                    
                    const IbeereLogo(
                      size: LogoSize.large,
                      showDecorations: true,
                    ),
                    const SizedBox(height: 64),
                    
                    const Text(
                      'Enter the 6-digit Code sent to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: IbeereDesignTokens.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    Text(
                      widget.phoneNumber,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: IbeereDesignTokens.textPrimary,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    IbeereOTPField(
                      length: 6,
                      onCompleted: _handleOTPComplete,
                      onChanged: (otp) {
                        setState(() {
                          _otp = otp;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Resend Code in ${_resendTimer}s ',
                          style: const TextStyle(
                            fontSize: 13,
                            color: IbeereDesignTokens.textSecondary,
                          ),
                        ),
                        GestureDetector(
                          onTap: _handleResendOTP,
                          child: Text(
                            'Resend OTP',
                            style: TextStyle(
                              fontSize: 13,
                              color: _resendTimer == 0
                                  ? const Color(0xFFDC2626)
                                  : IbeereDesignTokens.textTertiary,
                              fontWeight: FontWeight.w600,
                              decoration: _resendTimer == 0
                                  ? TextDecoration.underline
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'By Sign In, you agree to your\n',
                        style: TextStyle(
                          fontSize: 13,
                          color: IbeereDesignTokens.textSecondary,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms of services',
                            style: TextStyle(
                              color: Color(0xFFDC2626),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(text: ' & '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Color(0xFFDC2626),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              
              Positioned(
                bottom: 120,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF94A3B8),
                        width: 2,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _handleBack,
                        customBorder: const CircleBorder(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.arrow_back_rounded,
                              size: 24,
                              color: Color(0xFF64748B),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF64748B),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              Positioned(
                bottom: 24,
                right: 24,
                child: IbeereFloatingActionButton(
                  onPressed: _otp.length == 6
                      ? () {
                        }
                      : () {},
                  icon: Icons.play_arrow_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
