import 'package:flutter/material.dart';
import 'package:flutterquiz/core/theme/ibeere_tokens.dart';
import 'package:flutterquiz/ui/widgets/ibeere_v2_buttons.dart';

class SplashOnboarding1Screen extends StatelessWidget {
  const SplashOnboarding1Screen({super.key});

  static const String routeName = '/splash-onboarding-1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IbeereDesignTokens.backgroundLight,
      body: SafeArea(
        child: Stack(
          children: [
            _buildDecorativeShapes(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildTopBar(context),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        _buildIllustration(),
                        const SizedBox(height: 60),
                        _buildContent(),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                  _buildBottomSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildProgressIndicator(1),
        TextButton(
          onPressed: () {},
          child: Text(
            'Skip',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: IbeereDesignTokens.textSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator(int activeIndex) {
    return Row(
      children: List.generate(3, (index) {
        final isActive = index == activeIndex - 1;
        return Container(
          margin: const EdgeInsets.only(right: 8),
          width: isActive ? 40 : 12,
          height: 12,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF6B7280) : const Color(0xFFD1D5DB),
            borderRadius: BorderRadius.circular(6),
          ),
        );
      }),
    );
  }

  Widget _buildIllustration() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: const Offset(-40, 0),
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.primaryPink.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '?',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(50, 20),
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: IbeereDesignTokens.primaryPurple.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '?',
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Text(
          'Test Your Knowledge',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: IbeereDesignTokens.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          '"Challenge yourself with a variety\nof quizzes !"',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: IbeereDesignTokens.textSecondary,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        IbeereButton(
          text: 'Next',
          onPressed: () {},
          icon: Icons.arrow_forward_rounded,
          variant: IbeereButtonVariant.primary,
        ),
        const SizedBox(height: 32),
        _buildLogo(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ibeere',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: IbeereDesignTokens.primaryPurple,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildDecorativeShapes() {
    return Stack(
      children: [
        Positioned(
          top: 120,
          left: 20,
          child: _buildShape(60, const Color(0xFFFFB6C1), ShapeType.blob),
        ),
        Positioned(
          top: 180,
          right: 30,
          child: _buildShape(50, const Color(0xFFFEF3C7), ShapeType.blob),
        ),
        Positioned(
          top: 300,
          right: 100,
          child: _buildShape(35, const Color(0xFFBBF7D0), ShapeType.blob),
        ),
        Positioned(
          bottom: 350,
          left: 40,
          child: _buildShape(25, const Color(0xFFFBBF24), ShapeType.circle),
        ),
        Positioned(
          bottom: 300,
          right: 40,
          child: _buildShape(20, const Color(0xFF10B981), ShapeType.circle),
        ),
        Positioned(
          bottom: 280,
          left: 100,
          child: _buildShape(18, const Color(0xFF6B7280), ShapeType.square),
        ),
        Positioned(
          bottom: 250,
          right: 120,
          child: _buildShape(22, const Color(0xFF94A3B8), ShapeType.circle, outlined: true),
        ),
        Positioned(
          bottom: 200,
          left: 200,
          child: _buildShape(20, const Color(0xFF06B6D4), ShapeType.triangle),
        ),
        Positioned(
          bottom: 320,
          right: 200,
          child: _buildShape(16, const Color(0xFFEF4444), ShapeType.circle, outlined: true),
        ),
      ],
    );
  }

  Widget _buildShape(double size, Color color, ShapeType shape, {bool outlined = false}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : color.withOpacity(0.6),
        shape: shape == ShapeType.circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: shape == ShapeType.square ? BorderRadius.circular(4) : null,
        border: outlined ? Border.all(color: color.withOpacity(0.6), width: 2) : null,
      ),
    );
  }
}

enum ShapeType { circle, square, triangle, blob }
