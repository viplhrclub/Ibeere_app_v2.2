import 'package:flutter/material.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_buttons.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_inputs.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_common.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _phoneController = TextEditingController();
  String _countryCode = '+229';
  String _countryFlag = '🇧🇯';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    final phone = '$_countryCode${_phoneController.text}';
    Navigator.pushNamed(
      context,
      '/otp-verification',
      arguments: phone,
    );
  }

  void _showOtherMethods() {
  }

  void _handleForgotPassword() {
    Navigator.pushNamed(context, '/forgot-password');
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: IbeereDesignTokens.textPrimary,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    const Text(
                      'We happy to see you again.\nTo use app you should login first',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: IbeereDesignTokens.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 48),
                    
                    const Center(
                      child: IbeereLogo(
                        size: LogoSize.large,
                        showDecorations: true,
                      ),
                    ),
                    const SizedBox(height: 64),
                    
                    const Text(
                      'Choose you country & Enter your phone\nnumber to continue !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: IbeereDesignTokens.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    IbeerePhoneField(
                      controller: _phoneController,
                      countryCode: _countryCode,
                      countryFlag: _countryFlag,
                      onCountryChanged: (code) {
                        setState(() {
                          _countryCode = code;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: _showOtherMethods,
                          child: RichText(
                            text: const TextSpan(
                              text: 'Connect with others ',
                              style: TextStyle(
                                fontSize: 13,
                                color: IbeereDesignTokens.textSecondary,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Methods ?',
                                  style: TextStyle(
                                    color: IbeereDesignTokens.textPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: _handleForgotPassword,
                          child: const Text(
                            'Password forgot ?',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFFDC2626),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    
                    Center(
                      child: RichText(
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
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              
              Positioned(
                bottom: 24,
                right: 24,
                child: IbeereFloatingActionButton(
                  onPressed: _handleContinue,
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
